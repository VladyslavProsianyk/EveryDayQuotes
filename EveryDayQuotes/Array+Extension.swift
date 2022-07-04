//
//  Array+Extension.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 04.07.2022.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}
