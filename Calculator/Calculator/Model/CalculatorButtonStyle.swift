//
//  CalculatorButtonStyle.swift
//  Calculator
//
//  Created by Kalebu Patan on 10/26/23.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var isWide: Bool = false
    var isLandscape: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: isLandscape ? 16 : 32, weight: .medium))
            .frame(width: (isLandscape && isWide ? (size*2)+4 : size), height: size)
            .frame(maxWidth: isWide ? (isLandscape ? (size*2)+8 : .infinity) : size, alignment: .leading)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                }
            }
            .clipShape(Capsule())
    }
}

