//
//  MealModel.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//

import SwiftUI
import Alamofire

// MARK: - MealModel
class MealModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedLetter: Character = "A" // Initial selected letter
    @Published var isLoading = false
    @Published var selectedMeal: Meal?
    
    let alphabetLetters: [Character] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ") // Alphabet Buttons Array

    // MARK: Fetch Meals
    func fetchMeals() {
        let apiUrl = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(selectedLetter)"
        isLoading = true
        AF.request(apiUrl).responseDecodable(of: MealListResponse.self) { response in
            switch response.result {
            case .success(let mealListResponse):
                print("Meals fetched successfully for letter \(self.selectedLetter)")
                self.meals = mealListResponse.meals
                self.selectedMeal = self.meals.first
                self.isLoading = false

            case .failure(let error):
                print("Error fetching meals for letter \(self.selectedLetter): \(error)")
                self.meals = []

                self.isLoading = false
            }
        }
    }
    
    func fetchNextMeals() {
        if let index = alphabetLetters.firstIndex(of: selectedLetter) {
            selectedLetter = alphabetLetters[index + 1]
            fetchMeals()
        }
    }
    
    func fetchPreviousMeals() {
        if let index = alphabetLetters.firstIndex(of: selectedLetter) {
            selectedLetter = alphabetLetters[index - 1]
            fetchMeals()
        }
    }

    // MARK: Select Meal
    func selectMeal(meal: Meal) {
        self.selectedMeal = meal
    }
}

// MARK: - MealListResponse
struct MealListResponse: Decodable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Decodable, Equatable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strMealThumb: String
}
