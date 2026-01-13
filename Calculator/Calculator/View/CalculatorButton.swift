//
//  CalculatorButtons.swift
//  Calculator
//
//  Created by Kalebu Patan on 10/26/23.
//

import SwiftUI

struct CalculatorButton: View {
    
    let buttonType: ButtonType
    @EnvironmentObject private var viewModel: CalculatorViewModel
    
    var body: some View {
        Button(buttonType.description) {
            viewModel.performAction(for: buttonType)
        }
        .buttonStyle(CalculatorButtonStyle(
            size: getButtonSize(),
            backgroundColor: getBackgroundColor(),
            foregroundColor: getForegroundColor(),
            isWide: buttonType == .digit(.zero),
            isLandscape: viewModel.isLandscape)
        )
    }
    
    // MARK: - HELPERS
    
    private func getButtonSize() -> CGFloat {
        viewModel.getButtonSize()
    }
    
    private func getBackgroundColor() -> Color {
        viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
    }
    
    private func getForegroundColor() -> Color {
        viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
    }
}
