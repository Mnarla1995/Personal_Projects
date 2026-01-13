//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Kalebu Patan on 10/26/23.
//

import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    
    @Published private var calculator = Calculator()
    
    var displayText: String {
        return calculator.displayText
    }
    
    var isLandscape:Bool = false
    
    var portraitButtonTypes: [[ButtonType]] {
        let clearType: ButtonType = calculator.showAllClear ? .allClear : .clear
        return [
            [clearType, .negative, .percent, .operation(.division)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
            [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
            [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
            [.digit(.zero), .decimal, .equals]
        ]
    }
    
    var landscapeButtonTypes: [[ButtonType]] {
        let clearType: ButtonType = calculator.showAllClear ? .allClear : .clear
        return [
            [.openBracket, .closeBracket, .mc, .mPlus, .mMinus, .mr, clearType, .negative, .percent, .operation(.division)],
            [.second, .xSq, .xCube, .operation(.xY), .eX, .tenX, .digit(.four), .digit(.eight), .digit(.nine), .operation(.multiplication)],
            [.oneByX, .sqRootX, .cubeRootX, .operation(.yRootX), .ln, .log10, .digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
            [.xFact, .sin, .cos, .tan, .e, .EE, .digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
            [.Rad, .sinh, .cosh, .tanh, .pi, .Rand, .digit(.zero), .decimal, .equals]
        ]
    }
    
    // MARK: - ACTIONS
    
    func performAction(for buttonType: ButtonType) {
        switch buttonType {
        case .digit(let digit):
            calculator.setDigit(digit)
        case .operation(let operation):
            calculator.setOperation(operation)
        case .negative:
            calculator.toggleSign()
        case .percent:
            calculator.setPercent()
        case .decimal:
            calculator.setDecimal()
        case .equals:
            calculator.evaluate()
        case .allClear:
            calculator.allClear()
        case .clear:
            calculator.clear()
        default:
            calculator.scientificEvaluate(buttonType)
            break
        }
    }
    
    func deleteLastDigit() {
        calculator.deleteLastDigit()
    }
    
    // MARK: - HELPERS
    
    func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
        guard case .operation(let operation) = buttonType else { return false}
        return calculator.operationIsHighlighted(operation)
    }
    
    func getButtonSize() -> CGFloat {
        
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let screenWidth = scene.windows.first?.safeAreaLayoutGuide.layoutFrame.width, let screenheight = scene.windows.first?.safeAreaLayoutGuide.layoutFrame.height else { return 0 }
        
        if isLandscape {
            let buttonCount: CGFloat = CGFloat(landscapeButtonTypes.count)
            let spacingCount = buttonCount + 1
            return ((screenheight*0.92) - (spacingCount * 8)) / buttonCount
        } else {
            let buttonCount: CGFloat = CGFloat( portraitButtonTypes[0].count)
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * 16)) / buttonCount
        }
    }
}
