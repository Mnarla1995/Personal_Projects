//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Kalebu Patan on 10/26/23.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CalculatorViewModel())
        }
    }
}
