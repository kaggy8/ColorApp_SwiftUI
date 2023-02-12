//
//  DisplayColor.swift
//  Waether_APP
//
//  Created by Stanislav Demyanov on 11.02.2023.
//

import SwiftUI

struct DisplayColor: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(red: red/255, green: green/255, blue: blue/255))
            .frame(width: 350, height: 150)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 5))
    }
}

struct DisplayColor_Previews: PreviewProvider {
    static var previews: some View {
        DisplayColor(red: 23, green: 3, blue: 223)
    }
}
