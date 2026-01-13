//
//  ButtonType.swift
//  Calculator
//
//  Created by Kalebu Patan on 10/26/23.
//

import Foundation
import SwiftUI

enum Digit: Int, CaseIterable, CustomStringConvertible {
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}

enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
    
    case addition, subtraction, multiplication, division, xY, yRootX
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "−"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        case .xY:
            return "x^y"
        case .yRootX:
            return "x^(1/y)"
        }
    }
}

enum ButtonType: Hashable, CustomStringConvertible {
    
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case negative
    case percent
    case decimal
    case equals
    case allClear
    case clear
    case openBracket
    case closeBracket
    case mc
    case mPlus
    case mMinus
    case mr
    case second
    case xSq
    case xCube
    case eX
    case tenX
    case oneByX
    case sqRootX
    case cubeRootX
    case ln
    case log10
    case xFact
    case sin
    case cos
    case tan
    case e
    case EE
    case Rad
    case sinh
    case cosh
    case tanh
    case pi
    case Rand
    
    var description: String {
        
        switch self {
            
        case .digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .negative:
            return "±"
        case .percent:
            return "%"
        case .decimal:
            return "."
        case .equals:
            return "="
        case .allClear:
            return "AC"
        case .clear:
            return "C"
        case .closeBracket:
            return ")"
        case .openBracket:
            return "("
        case .mPlus:
            return "m+"
        case .mc:
            return "mc"
        case .mMinus:
            return "m-"
        case .mr:
            return "mr"
        case .second:
            return "2nd"
        case .xSq:
            return "x^2"
        case .xCube:
            return "x^3"
        case .eX:
            return "e^x"
        case .tenX:
            return "10^x"
        case .oneByX:
            return "1/x"
        case .sqRootX:
            return "x^(1/2)"
        case .cubeRootX:
            return "x^(1/3)"
        case .ln:
            return "ln"
        case .log10:
            return "log10"
        case .xFact:
            return "x!"
        case .sin:
            return "sin"
        case .cos:
            return "cos"
        case .tan:
            return "tan"
        case .e:
            return "e"
        case .EE:
            return "EE"
        case .Rad:
            return "Rad"
        case .sinh:
            return "sinh"
        case .cosh:
            return "cosh"
        case .tanh:
            return "tanh"
        case .pi:
            return "pi"
        case .Rand:
            return "Rand"
        }
    }
    
    var backgroundColor: Color {
        
        switch self {
            
        case .allClear, .clear, .negative, .percent:
            return Color(.lightGray)
        case .operation(let val):
            return !(val == .xY || val == .yRootX) ? .orange : .secondary
        case .equals:
            return .orange
        case .digit, .decimal:
            return Color(.lightGray.withAlphaComponent(0.3))
        default:
            return .secondary
        }
    }
    
    var foregroundColor: Color {
        
        switch self {
            
        case .allClear, .clear, .negative, .percent:
            return .black
        default:
            return .white
        }
    }
}
