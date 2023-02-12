//
//  TextFieldColor.swift
//  Waether_APP
//
//  Created by Stanislav Demyanov on 11.02.2023.
//

import SwiftUI

struct TextFieldColor: View {
    @Binding var textColor: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            TextField("", text: $textColor) { _ in
                withAnimation {
                    checkNumber()
                }
            }
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.trailing)
            .keyboardType(.decimalPad)
            .frame(width: 50, height: 40, alignment: .leading)
            .alert("Неверное число", isPresented: $showAlert, actions: {}) {
                Text("Введите число от 0 до 255")
            }
        }
    }
}

struct TextFieldColor_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldColor(textColor: .constant("123"), value: .constant(123))
    }
}

extension TextFieldColor {
    private func checkNumber() {
        if let value = Int(textColor), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        textColor = "0"
    }
}
