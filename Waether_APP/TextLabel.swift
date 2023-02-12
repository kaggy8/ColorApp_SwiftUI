//
//  TextLabel.swift
//  Waether_APP
//
//  Created by Stanislav Demyanov on 11.02.2023.
//

import SwiftUI

struct TextLabel: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 50, height: 40, alignment: .trailing)
    }
}

struct TextLabel_Previews: PreviewProvider {
    static var previews: some View {
        TextLabel(text: "123")
    }
}
