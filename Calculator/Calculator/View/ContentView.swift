//
//  ContentView.swift
//  Calculator
//
//  Created by Kalebu Patan on 10/26/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @EnvironmentObject private var viewModel: CalculatorViewModel
    @State private var isLandscape = false
    
    var body: some View {
        VStack(spacing: self.isLandscape ? -20 : 16) {
            Spacer()
            Text(viewModel.displayText)
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 88, weight: .light))
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .gesture(DragGesture(minimumDistance: 10,coordinateSpace: .local)
                    .onEnded({ value in
                        viewModel.deleteLastDigit()
                    }))
            VStack(spacing: self.isLandscape ? 8 : 16) {
                ForEach(self.isLandscape ? viewModel.landscapeButtonTypes : viewModel.portraitButtonTypes, id: \.self) { row in
                    HStack(spacing: self.isLandscape ? 8 : 16) {
                        ForEach(row, id: \.self) { buttonType in
                            CalculatorButton(buttonType: buttonType)
                        }
                    }
                }
            }

        }
        .padding(10)
        .background(Color.black)
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            self.viewModel.isLandscape = scene.interfaceOrientation.isLandscape
            self.isLandscape = self.viewModel.isLandscape
        }
    }
}

#Preview {
    ContentView()
}

