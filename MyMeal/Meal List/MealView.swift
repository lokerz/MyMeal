import SwiftUI

struct MealView: View {
    @StateObject var mealModel = MealModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Alphabet buttons for selecting the initial letter
                AlphabetButtonsView(mealModel: mealModel)
                
                // List of meals or loading view
                if mealModel.isLoading {
                    LoadingView() // Display the loading view
                } else {
                    List(mealModel.meals, id: \.idMeal) { meal in
                        // Use NavigationLink to navigate to MealDetailsView
                        NavigationLink(destination: MealDetailsView(meal: meal)) {
                            MealRow(meal: meal)
                        }
                    }
                }
            }
            .navigationBarTitle("Meals")
        }
        .onAppear {
            // Fetch data when the view appears
            mealModel.fetchMeals()
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
