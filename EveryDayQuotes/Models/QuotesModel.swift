//
//  QuotesModel.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 02.07.2022.
//

import Foundation

struct QuotesModel: Codable, Hashable {
    var text: String
    var author: String?
}

