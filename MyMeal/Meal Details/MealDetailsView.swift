//
//  MealDetailsView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//
import SwiftUI
import Kingfisher

struct MealDetailsView: View {
    @StateObject var mealDetailsModel = MealDetailsModel()
    var meal: Meal?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Display the meal's image
                if mealDetailsModel.isLoading {
                    LoadingView()
                } else if let mealDetails = mealDetailsModel.mealDetails.first {
                    // Display the meal's image
                    KFImage(URL(string: mealDetails.strMealThumb))
                        .resizable()
                        .placeholder {
                            DefaultImage()
                        }
                        .cancelOnDisappear(true)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(8)
                    
                    // Display meal details
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .center) {
                            Text("Category: ")
                                .fontWeight(.bold)
                            Text(mealDetails.strCategory)
                        }
                        HStack(alignment: .center) {
                            Text("Area: ")
                                .fontWeight(.bold)
                            Text(mealDetails.strArea)
                        }
                    }
                    
                    // Display ingredients and measures
                    Text("Ingredients:")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // Display the ingredients and measures
                    ForEach(mealDetails.ingredients(), id: \.name) { ingredient in
                        Text("• \(ingredient.name.capitalized): \(ingredient.measure)")
                            .padding(.horizontal, 16)
                    }
                    
                    // Display instructions
                    Text("Instructions:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(mealDetails.strInstructions)
                        .font(.body)
                        .padding(.horizontal, 16)
                }
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(self.meal?.strMeal.capitalized ?? "Meal Details")
        .onAppear {
            print(self.meal ?? "Meal not found")
            if let meal = self.meal {
                mealDetailsModel.fetchMeals(mealID: meal.idMeal)
            }
        }
    }
}

struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        return MealDetailsView()
    }
}
