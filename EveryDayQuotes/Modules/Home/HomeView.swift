//
//  HomeView.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 02.07.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @State private var showingChangeBackground = false
    
    var body: some View {
        
        if !viewModel.isLoading {
            NavigationView {
                ZStack(alignment: .trailing) {
                    Image(viewModel.savedImageName)
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    VTabView {
                        ForEach(0..<viewModel.quotes.count, id: \.self) { index in
                            QuoteView(quote: viewModel.quotes[index])
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                                .padding(10)
                            
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .cornerRadius(10)
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            
//                            Button {
//                                print("Create own quote")
//                                self.showingChangeBackground.toggle()
//                            } label: {
//                                Image(systemName: "plus")
//                                    .resizable()
//                                    .frame(width: 25, height: 25, alignment: .center)
//                            }
//
//                            .frame(width: 30, height: 30, alignment: .center)
//                            .padding(10)
//                            .background(.mint)
//                            .clipShape(Capsule())
//                            .foregroundColor(.black)
//
                            Button {
                                self.showingChangeBackground.toggle()
                            } label: {
                                Image("change_background_icon")
                                    .resizable()
                            }
                            .popover(isPresented: $showingChangeBackground, arrowEdge: .trailing) {
                                ChangeBackgroundView(isPresenting: $showingChangeBackground)
                            }
                            .frame(width: 30, height: 30, alignment: .center)
                            .padding(10)
                            .background(.mint)
                            .clipShape(Capsule())
                        }
                    }
                    .padding(10)
                }
                .edgesIgnoringSafeArea([.top, .bottom])
                .navigationBarHidden(true)
                .navigationBarTitle(Text("Home"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .statusBar(hidden: true)
            }
            
        } else {
            ProgressView()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}


