import SwiftUI

struct MealView: View {
    // Observable object to fetch meal data
    @ObservedObject var mealModel = MealModel()
    
    // State variable to track the selected letter
    @State private var selectedLetter: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // Alphabet buttons for selecting the initial letter
                AlphabetButtonsView(selectedLetter: $selectedLetter, mealModel: mealModel)

                // List of meals
                List(mealModel.meals, id: \.idMeal) { meal in
                    MealRow(meal: meal)
                }
            }
            .navigationBarTitle("Meals")
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
