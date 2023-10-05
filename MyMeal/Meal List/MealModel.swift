import Foundation
import Alamofire

class MealModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedLetter: Character = "A" // Initial selected letter
    @Published var isLoading: Bool = false
    
    func fetchMeals() {
        let apiUrl = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(selectedLetter)"
        isLoading = true
        AF.request(apiUrl).responseDecodable(of: MealListResponse.self) { response in
            switch response.result {
            case .success(let mealListResponse):
                print("Meals fetched successfully for letter \(self.selectedLetter)")
                
                self.meals = mealListResponse.meals
                
                self.isLoading = false

            case .failure(let error):
                print("Error fetching meals for letter \(self.selectedLetter): \(error)")
                self.isLoading = false
            }
        }
    }
}

struct MealListResponse: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strMealThumb: String
}
