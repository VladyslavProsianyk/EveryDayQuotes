//
//  HomeViewModel.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 02.07.2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var quotes: [QuotesModel] = [] {
        willSet {
            if !newValue.isEmpty {
                isLoading = false
            }
        }
    }
    
    @Published var isLoading: Bool = true
    
    @Published var isNeedToBeDissmissed: Bool = false
    
    @Published var savedImageName: String = UserDefaults.standard.savedImageName {
        didSet{
            UserDefaults.standard.savedImageName = savedImageName
        }
    }
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        getQutoes()
        setPublishers()
    }
    
    func setPublishers() {
        UserDefaults
            .standard
            .publisher(for: \.savedImageName)
            .sink { [weak self] newValue in
                guard let self = self else { return }
                if newValue != self.savedImageName {
                    self.savedImageName = newValue
                }
            }.store(in: &bag)
        
        UserDefaults
            .standard
            .publisher(for: \.savedQuotes)
            .sink { [weak self] newValue in
                guard let self = self else { return }
                newValue.forEach { quote in
                    if !self.quotes.contains(quote) {
                        self.quotes.insert(quote, at: 0)
                    }
                }
            }.store(in: &bag)
    }
    
    func getQutoes() {
        guard let url = URL(string: "https://type.fit/api/quotes") else { return }
        isLoading = true
        
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [QuotesModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] quotes in
                self?.quotes = UserDefaults.standard.savedQuotes
                self?.quotes.append(contentsOf: quotes)
            })
            .store(in: &bag)
    }
    
}
