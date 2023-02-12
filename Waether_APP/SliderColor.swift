//
//  SliderColor.swift
//  Waether_APP
//
//  Created by Stanislav Demyanov on 11.02.2023.
//

import SwiftUI

struct SliderColor: View {
    @Binding var value: Double
    
    let color: Color
    
    var body: some View {
        HStack {
            Slider(value: $value,
                   in: 0...255,
                   step: 1)
            .tint(color)
        }
        .padding()
    }
}

struct SliderColor_Previews: PreviewProvider {
    static var previews: some View {
        SliderColor(value: .constant(123), color: .red)
    }
}
