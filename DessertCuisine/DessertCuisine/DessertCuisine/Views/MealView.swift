//
//  MealView.swift
//  DessertCuisine
//
//  Created by Kalebu Patan on 1/8/24.
//

import SwiftUI

struct MealView: View {
    
    @EnvironmentObject private var viewModel: MealDetailsViewModel
    
    var body: some View {
        if let detailMeal = viewModel.detailMeal {
            List {
                Section(K.IngMeasurements) {
                    ForEach(detailMeal.ingredients.sorted(by: >), id: \.key) { ing, mes in
                        HStack {
                            Text(ing.capitalized)
                            Spacer()
                            Text(mes)
                        }
                    }
                }
                Section(K.instructions) {
                    Text(detailMeal.strInstructions)
                    AsyncImage(url: URL(string: detailMeal.strMealThumb)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                    }
                }
                
            }
            .navigationTitle(detailMeal.strMeal)
        }
    }
}

