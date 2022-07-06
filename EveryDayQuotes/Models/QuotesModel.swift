//
//  QuotesModel.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 02.07.2022.
//

import Foundation

@objc class QuotesModel: NSObject, Codable {
    var text: String
    var author: String?
    
    init(text: String, author: String?) {
        self.text = text
        self.author = author
    }
}

