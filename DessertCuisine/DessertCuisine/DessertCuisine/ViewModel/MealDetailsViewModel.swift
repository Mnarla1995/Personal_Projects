//
//  MealDetailsViewModel.swift
//  DessertCuisine
//
//  Created by Kalebu Patan on 1/8/24.
//

import Foundation

class MealDetailsViewModel: ObservableObject {
    
    let id: String
    
    @Published var detailMeal:FilteredDetailMeal?
    
    init(id: String) {
        self.id = id
        self.getDetailMeal()
    }
    
    private func getDetailMeal() {
        guard let url = URL(string: K.detailMealUrl+id) else {return}
        Task {
            do {
                let (data,_) = try await URLSession.shared.data(from: url)
                let detailMeals = try JSONDecoder().decode(DetailMeals.self, from: data)
                await MainActor.run {
                    if let first = detailMeals.meals.first {
                        self.detailMeal = self.filteredMeals(first)
                    }
                }
            } catch {
                
            }
        }
    }
    
    private func filteredMeals(_ detailMeal:DetailMeal) -> FilteredDetailMeal {
        
        var filter = [String:String]()
        
        if let ing = detailMeal.strIngredient1, ing != K.empty, let mes = detailMeal.strMeasure1, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient2, ing != K.empty, let mes = detailMeal.strMeasure2, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient3, ing != K.empty, let mes = detailMeal.strMeasure3, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient4, ing != K.empty, let mes = detailMeal.strMeasure4, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient5, ing != K.empty, let mes = detailMeal.strMeasure5, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient6, ing != K.empty, let mes = detailMeal.strMeasure6, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient7, ing != K.empty, let mes = detailMeal.strMeasure7, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient8, ing != K.empty, let mes = detailMeal.strMeasure8, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient9, ing != K.empty, let mes = detailMeal.strMeasure9, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient10, ing != K.empty, let mes = detailMeal.strMeasure10, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient11, ing != K.empty, let mes = detailMeal.strMeasure11, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient12, ing != K.empty, let mes = detailMeal.strMeasure12, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient13, ing != K.empty, let mes = detailMeal.strMeasure13, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient14, ing != K.empty, let mes = detailMeal.strMeasure14, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient15, ing != K.empty, let mes = detailMeal.strMeasure15, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient16, ing != K.empty, let mes = detailMeal.strMeasure16, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient17, ing != K.empty, let mes = detailMeal.strMeasure17, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient18, ing != K.empty, let mes = detailMeal.strMeasure18, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient19, ing != K.empty, let mes = detailMeal.strMeasure19, mes != K.empty {
            filter[ing] = mes
        }
        if let ing = detailMeal.strIngredient20, ing != K.empty, let mes = detailMeal.strMeasure20, mes != K.empty {
            filter[ing] = mes
        }
        
        return FilteredDetailMeal(strMeal: detailMeal.strMeal,
                                  strMealThumb: detailMeal.strMealThumb,
                                  strInstructions: detailMeal.strInstructions,
                                  idMeal: detailMeal.idMeal,
                                  ingredients: filter)
    }
}
