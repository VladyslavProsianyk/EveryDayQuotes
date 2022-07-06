//
//  AddNewQuoteView.swift
//  EveryDayQuotes
//
//  Created by Vladyslav Prosianyk on 05.07.2022.
//

import SwiftUI

struct AddNewQuoteView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var viewModel = AddNewQuoteViewModel()
    @State var textFieldInput: String = ""
    @State var showingAlert: Bool = false
    @State var showingToast: Bool = false
    
    var body: some View {
        VStack(alignment: .trailing) {
            
            TextEditor(text: $textFieldInput)
                .frame(minHeight: 30)
                .padding(10)
                .background(.gray.opacity(0.3))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2))
                .cornerRadius(10)
                .lineLimit(0)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Spacer(minLength: 200)
            
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Enter your new quote")
        .navigationBarTitleDisplayMode(.inline)
        .toast(message: "To save you should enter some text!", isShowing: $showingToast, duration: 3)
        .navigationBarItems(
            leading:
                Button("Cancel", action: { showingAlert = true })
                .foregroundColor(.red)
                .alert("Important message", isPresented: $showingAlert) {
                    Button("Cancel anyway") { presentationMode.wrappedValue.dismiss() }
                        .foregroundColor(.red)
                    Button("Continue editing") { }
                        .foregroundColor(.blue)
                },
            
            trailing:
                Button(action : {
                    if !textFieldInput.isEmpty {
                        viewModel.saveNewQuoteWithText(textFieldInput)
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showingToast.toggle()
                    }
                }){
                    Text("Save")
                        .font(.body)
                        .foregroundColor(.blue)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
        )
    }
}

struct AddNewQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewQuoteView()
    }
}
