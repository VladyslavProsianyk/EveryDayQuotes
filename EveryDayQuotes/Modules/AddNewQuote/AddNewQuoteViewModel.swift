//
//  AddNewQuoteViewModel.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 06.07.2022.
//

import Foundation

class AddNewQuoteViewModel: ObservableObject {
    
    func saveNewQuoteWithText(_ text: String){
        var savedQuotes = UserDefaults.standard.savedQuotes
        let newQuote = QuotesModel(text: text, author: "Me")
        savedQuotes.append(newQuote)
        UserDefaults.standard.savedQuotes = savedQuotes
    }
        
}
