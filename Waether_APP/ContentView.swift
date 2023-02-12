//
//  ContentView.swift
//  Waether_APP
//
//  Created by Stanislav Demyanov on 11.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red: Double = 122
    @State private var green: Double = 123
    @State private var blue: Double = 124
    @State private var textColorRed = ""
    @State private var textColorGreen = ""
    @State private var textColorBlue = ""
    
    @FocusState private var focusedField: Bool
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color(CGColor(red: 35/255, green: 85/255, blue: 135/255, alpha: 1))
                .ignoresSafeArea()
            
            VStack {
                DisplayColor(red: red, green: green, blue: blue)
                
                VStack {
                    HStack {
                        TextLabel(text: String(format: "%g", red))
                        SliderColor(value: $red, color: .red)
                            .onChange(of: red) { newValue in
                                textColorRed = ("\(lround(newValue))")
                            }
                        TextFieldColor(textColor: $textColorRed, value: $red)
                            .focused($focusedField)
                    }.onAppear {
                        textColorRed = "\(lround(red))"
                    }
                    
                    
                    HStack {
                        TextLabel(text: String(format: "%g", green))
                        SliderColor(value: $green, color: .green)
                            .onChange(of: green) { newValue in
                                textColorGreen = ("\(lround(newValue))")
                            }
                        TextFieldColor(textColor: $textColorGreen, value: $green)
                            .focused($focusedField)
                    }
                    .onAppear {
                        textColorGreen = "\(lround(blue))"
                    }
                    
                    
                    HStack {
                        TextLabel(text: String(format: "%g", blue))
                        SliderColor(value: $blue, color: .blue)
                            .onChange(of: blue) { newValue in
                                textColorBlue = ("\(lround(newValue))")
                            }
                        TextFieldColor(textColor: $textColorBlue, value: $blue)
                            .focused($focusedField)
                    }
                    .onAppear {
                        textColorBlue = "\(lround(blue))"
                    }
                    
                }
                .padding()
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusedField = false
                    }
                }
            }
            Spacer()
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
