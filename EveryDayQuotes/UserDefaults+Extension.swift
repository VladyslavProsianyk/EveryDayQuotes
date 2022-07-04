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
}
