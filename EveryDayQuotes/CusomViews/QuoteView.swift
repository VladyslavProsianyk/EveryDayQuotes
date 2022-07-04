//
//  QuoteView.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 04.07.2022.
//

import SwiftUI

struct QuoteView: View {
    private let quote: QuotesModel
    init(quote: QuotesModel) {
        self.quote = quote
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 15) {
            Text(quote.text)
                .font(.title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("\(quote.author ?? "")")
                .font(.system(size: 14))
                .foregroundColor(Color.black.opacity(0.8))
                .multilineTextAlignment(.leading)
                
        }
        .padding()
    }
}
