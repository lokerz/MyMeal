//
//  MealDetailsModel.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//

import Foundation
import Alamofire

class MealDetailsModel: ObservableObject {
    @Published var mealDetails: [MealDetails] = [] // Store fetched meal details
    @Published var isLoading: Bool = false // Indicate if data is being loaded
    
    // Function to fetch meal details by meal ID
    func fetchMeals(mealID: String) {
        let apiUrl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        isLoading = true
        AF.request(apiUrl).responseDecodable(of: MealDetailsResponse.self) { response in
            switch response.result {
            case .success(let mealListResponse):
                print("Meals fetched successfully for id \(mealID)")
                self.mealDetails = mealListResponse.meals // Update the meal details
                
                self.isLoading = false // Data loading is complete

            case .failure(let error):
                print("Error fetching meals for id \(mealID): \(error)")
                self.isLoading = false // Data loading encountered an error
            }
        }
    }
}

struct MealDetailsResponse: Decodable {
    let meals: [MealDetails]
}

struct MealDetails: Decodable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    // Function to extract ingredients and measures from the struct
    func ingredients() -> [Ingredient] {
        var ingredientsAndMeasures: [Ingredient] = []
        for index in 1..<21 {
            if let ingredient = self.value(forIngredientAtIndex: index),
               let measure = self.value(forMeasureAtIndex: index),
               !ingredient.isEmpty {
                let ingredientModel = Ingredient(name: ingredient, measure: measure)
                ingredientsAndMeasures.append(ingredientModel)
            }
        }
        return ingredientsAndMeasures
    }
}

// Define a struct to represent ingredients and measures
struct Ingredient {
    let name: String
    let measure: String
}

// Extension to access ingredient and measure values by index
extension MealDetails {
    func value(forIngredientAtIndex index: Int) -> String? {
        switch index {
        case 1: return strIngredient1
        case 2: return strIngredient2
        case 3: return strIngredient3
        case 4: return strIngredient4
        case 5: return strIngredient5
        case 6: return strIngredient6
        case 7: return strIngredient7
        case 8: return strIngredient8
        case 9: return strIngredient9
        case 10: return strIngredient10
        case 11: return strIngredient11
        case 12: return strIngredient12
        case 13: return strIngredient13
        case 14: return strIngredient14
        case 15: return strIngredient15
        case 16: return strIngredient16
        case 17: return strIngredient17
        case 18: return strIngredient18
        case 19: return strIngredient19
        case 20: return strIngredient20
        default: return nil
        }
    }
    
    func value(forMeasureAtIndex index: Int) -> String? {
        switch index {
        case 1: return strMeasure1
        case 2: return strMeasure2
        case 3: return strMeasure3
        case 4: return strMeasure4
        case 5: return strMeasure5
        case 6: return strMeasure6
        case 7: return strMeasure7
        case 8: return strMeasure8
        case 9: return strMeasure9
        case 10: return strMeasure10
        case 11: return strMeasure11
        case 12: return strMeasure12
        case 13: return strMeasure13
        case 14: return strMeasure14
        case 15: return strMeasure15
        case 16: return strMeasure16
        case 17: return strMeasure17
        case 18: return strMeasure18
        case 19: return strMeasure19
        case 20: return strMeasure20
        default: return nil
        }
    }
}
