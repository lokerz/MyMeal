//
//  MealModel.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 04/10/23.
//

import Foundation
import Alamofire

class MealModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func fetchMeals(withLetter letter: String) {
        let apiUrl = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)"
        
        AF.request(apiUrl).responseDecodable(of: MealListResponse.self) { response in
            switch response.result {
            case .success(let mealListResponse):
                DispatchQueue.main.async {
                    self.meals = mealListResponse.meals
                }
            case .failure(let error):
                // Handle error cases
                print("Error fetching meals: \(error)")
            }
        }
    }
}

struct Meal: Decodable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strMealThumb: String
}

struct MealListResponse: Decodable {
    let meals: [Meal]
}
