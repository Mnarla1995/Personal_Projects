//
//  DessertViewModel.swift
//  DessertCuisine
//
//  Created by Kalebu Patan on 1/8/24.
//

import Foundation
import SwiftUI

class DessertViewModel: ObservableObject {
    @Published var meals: [CategoryMeal] = []
    
    init() {
        self.getDessertMeals()
    }
    
    private func getDessertMeals() {
        guard let url = URL(string: K.dessertUrl) else {return}
        Task {
            do {
                let (data,_) = try await URLSession.shared.data(from: url)
                let categoryMeals = try JSONDecoder().decode(CategoryMeals.self, from: data)
                await MainActor.run {
                    self.meals = categoryMeals.meals
                }
            } catch {
                
            }
        }
    }
}
