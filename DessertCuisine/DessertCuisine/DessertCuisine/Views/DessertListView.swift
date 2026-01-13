//
//  DessertListView.swift
//  DessertCuisine
//
//  Created by Kalebu Patan on 1/8/24.
//

import SwiftUI

struct DessertListView: View {
    
    @EnvironmentObject private var viewModel: DessertViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.meals,id: \.idMeal) { meal in
                    NavigationLink(destination: MealView().environmentObject(MealDetailsViewModel(id: meal.idMeal.wrappedValue))) {
                        VStack {
                            HStack {
                                Text(meal.strMeal.wrappedValue)
                                Spacer()
                                AsyncImage(url: URL(string: meal.strMealThumb.wrappedValue)) { image in
                                    image.resizable()
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    Color.gray
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(K.dessert)
        }
    }
}

#Preview {
    DessertListView()
}
