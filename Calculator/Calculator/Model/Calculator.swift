//
//  Calculator.swift
//  Calculator
//
//  Created by Kalebu Patan on 10/26/23.
//

import Foundation

struct Calculator {
    
    private struct ArithmeticExpression: Equatable {
        var number: Decimal
        var operation: ArithmeticOperation
        
        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operation {
            case .addition:
                return number + secondNumber
            case .subtraction:
                return number - secondNumber
            case .multiplication:
                return number * secondNumber
            case .division:
                return number / secondNumber
            case .xY:
                return pow(number, Int(secondNumber.doubleValue))
            case .yRootX:
                if secondNumber == 0 {
                    return .greatestFiniteMagnitude
                }
                return pow(number, 1/(Int(secondNumber.doubleValue) ))
            }
        }
    }
    
    // MARK: - PROPERTIES
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingNegative = false
            carryingDecimal = false
            carryingZeroCount = 0
            pressedClear = false
        }
    }
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    private var carryingNegative: Bool = false
    private var carryingDecimal: Bool = false
    private var carryingZeroCount: Int = 0
    
    private var pressedClear: Bool = false
    
    // MARK: - COMPUTED PROPERTIES
    
    var displayText: String {
        return getNumberString(forNumber: number, withCommas: true)
    }
    
    var showAllClear: Bool {
        newNumber == nil && expression == nil && result == nil || pressedClear
    }
        
    var number: Decimal? {
        if pressedClear || carryingDecimal {
            return newNumber
        }
        return newNumber ?? expression?.number ?? result
    }
    
    private var containsDecimal: Bool {
        return getNumberString(forNumber: number).contains(".")
    }
    
    // MARK: - OPERATIONS
    
    mutating func setDigit(_ digit: Digit) {
        if containsDecimal && digit == .zero {
            carryingZeroCount += 1
        } else if canAddDigit(digit) {
            let numberString = getNumberString(forNumber: newNumber)
            newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
        }
    }
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
        guard var number = newNumber ?? result else { return }
        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }
        expression = ArithmeticExpression(number: number, operation: operation)
        newNumber = nil
    }
    
    mutating func toggleSign() {
        if let number = newNumber {
            newNumber = -number
            return
        }
        if let number = result {
            result = -number
            return
        }
        
        carryingNegative.toggle()
    }
    
    mutating func setPercent() {
        if let number = newNumber {
            newNumber = number / 100
            return
        }
        if let number = result {
            result = number / 100
            return
        }
    }
    
    mutating func setDecimal() {
        if containsDecimal { return }
        carryingDecimal = true
    }
    
    mutating func evaluate() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        result = expressionToEvaluate.evaluate(with: number)
        expression = nil
        newNumber = nil
    }
    
    mutating func allClear() {
        newNumber = nil
        expression = nil
        result = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
    }
    
    mutating func clear() {
        newNumber = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
        
        pressedClear = true
    }
    
    mutating func deleteLastDigit() {
        var new = newNumber.map(String.init)
        new?.removeLast()
        if new?.count == 0 {
            clear()
            return
        }
        newNumber = Decimal(string:new ?? "0")
        
    }
    
    mutating func scientificEvaluate(_ type:ButtonType) {
        guard let number = newNumber else { return }
        switch type {
        
        case .openBracket:
            result = nil
            return
        case .closeBracket:
            result = nil
            return
        case .mc:
            result = nil
            break
        case .mPlus:
            result = nil
            break
        case .mMinus:
            result = nil
            break
        case .mr:
            result = nil
            break
        case .second:
            result = nil
            break
        case .xSq:
            result = pow(number, 2)
        case .xCube:
            result = pow(number, 3)
        case .eX:
            result = Decimal(exp(number.doubleValue))
        case .tenX:
            result = pow(10, Int(number.doubleValue))
        case .oneByX:
            result = 1/number
        case .sqRootX:
            result = pow(number, 1/2)
        case .cubeRootX:
            result = pow(number, 1/3)
        case .ln:
            result = Decimal(log(number.doubleValue))
        case .log10:
            result = Decimal(log10(number.doubleValue))
        case .xFact:
            result = Decimal((1...Int(number.doubleValue)).map(Double.init).reduce(1.0, *))
        case .sin:
            result = Decimal(sin(number.doubleValue))
        case .cos:
            result = Decimal(cos(number.doubleValue))
        case .tan:
            result = Decimal(tan(number.doubleValue))
        case .e:
            result = Decimal(exp(1))
        case .EE:
            result = nil
            break
        case .Rad:
            result = nil
            break
        case .sinh:
            result = Decimal(sinh(number.doubleValue))
        case .cosh:
            result = Decimal(cosh(number.doubleValue))
        case .tanh:
            result = Decimal(tanh(number.doubleValue))
        case .pi:
            result = Decimal(.pi)
        case .Rand:
            break
        default: 
            result = nil
            break
        }
        expression = nil
        newNumber = nil
    }
    
    // MARK: - HELPERS
    
    func operationIsHighlighted(_ operation: ArithmeticOperation) -> Bool {
        return expression?.operation == operation && newNumber == nil
    }
    
    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        
        var numberString = (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
        
        if carryingNegative {
            numberString.insert("-", at: numberString.startIndex)
        }
        
        if carryingDecimal {
            numberString.insert(".", at: numberString.endIndex)
        }
        
        if carryingZeroCount > 0 {
            numberString.append(String(repeating: "0", count: carryingZeroCount))
        }
        
        return numberString
    }
    
    private func canAddDigit(_ digit: Digit) -> Bool {
        return number != nil || digit != .zero
    }
}

extension Decimal {
    var doubleValue:Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
