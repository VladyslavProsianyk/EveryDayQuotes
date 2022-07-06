//
//  UserDefaults+Extension.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 04.07.2022.
//

import Foundation

extension UserDefaults {
    @objc dynamic var savedImageName: String {
        get { string(forKey: "savedImageName") ?? "bg2" }
        set { setValue(newValue, forKey: "savedImageName") }
    }
    
    @objc dynamic var savedQuotes: [QuotesModel] {
        get {
            guard let savedData = data(forKey: "savedQuotes") else { return [] }
            return (try? JSONDecoder().decode([QuotesModel].self, from: savedData)) ?? []
        }
        set {
            guard let dataToSave = try? JSONEncoder().encode(newValue) else { return }
            setValue(dataToSave, forKey: "savedQuotes")
        }
    }
}
