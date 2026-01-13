//
//  CategoryMeals.swift
//  DessertCuisine
//
//  Created by Kalebu Patan on 1/8/24.
//

import Foundation

struct CategoryMeals: Decodable {
    var meals: [CategoryMeal]
}

struct CategoryMeal: Decodable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}
