//
//  ChangeBackgroundView.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 04.07.2022.
//

import SwiftUI

struct ChangeBackgroundView: View {
        
    private let imageNames: [String] = [
                "bg2",
                "bg3",
                "bg4",
                "bg5",
                "bg6",
                "bg7",
                "bg8",
                "bg9",
                "bg10",
                "bg11",
                "bg12",
                "bg13",
                "bg14",
                "bg15",
                "bg16",
                "bg17",
                "bg18",
                "bg19",
                "bg20"
    ]
    
    private let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    @Binding var isPresenting: Bool
    
    var body: some View {
        VStack {
            Text("Choose background".uppercased())
                .font(.title.bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(.radialGradient(colors: [.purple, .blue, .cyan], center: .center, startRadius: 150, endRadius: 5))
                .cornerRadius(10)
                .shadow(color: .blue, radius: 6, x: 0, y: 3)
                .padding(20)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .frame(width: 100, height: 190, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.6), radius: 6, x: 0, y: 2)
                            .onTapGesture {
                                UserDefaults.standard.savedImageName = imageName
                                self.isPresenting.toggle()
                            }
                    }
                }
                .padding(.horizontal)
                .frame(maxHeight: .infinity)
                .padding(10)
            }
        }
        .background(.mint)
        
    }
}

struct ChangeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeBackgroundView(isPresenting: .constant(true))
    }
}
