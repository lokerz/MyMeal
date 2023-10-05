import SwiftUI

struct MealView: View {
    @StateObject var mealModel = MealModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Alphabet buttons for selecting the initial letter
                AlphabetButtonsView(mealModel: mealModel)
                
                Spacer(minLength: 20)
                
                // List of meals or loading view
                if mealModel.isLoading {
                    LoadingView() // Display the loading view
                } else {
                    if mealModel.meals.isEmpty {
                        EmptyView()
                    } else {
                        NavigationView {
                            List(mealModel.meals, id: \.idMeal) { meal in
                                MealRow(meal: meal, selectedMeal: mealModel.selectedMeal)
                                    .onTapGesture {
                                        withAnimation {
                                            mealModel.selectMeal(meal: meal)
                                        }
                                    }
                            }
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
        .tint(.orange)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
