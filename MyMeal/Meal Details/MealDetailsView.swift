//
//  MealDetailsView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//
import SwiftUI
import Kingfisher

// MARK: Meals Detail View
struct MealDetailsView: View {
    @StateObject var mealDetailsModel = MealDetailsModel()
    var mealID: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if mealDetailsModel.isLoading {
                    LoadingView()

                } else if let mealDetails = mealDetailsModel.mealDetails.first {
                    // MARK: Image Section: Display the meal's image
                    KFImage(URL(string: mealDetails.strMealThumb))
                        .resizable()
                        .placeholder {
                            DefaultImage()
                        }
                        .cancelOnDisappear(true)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(8)

                    // MARK: Display meal details
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

                    Spacer()

                    // Display ingredients and measures
                    Text("Ingredients:")
                        .font(.title2)
                        .fontWeight(.bold)

                    // Display the ingredients and measures
                    ForEach(mealDetails.ingredients(), id: \.name) { ingredient in
                        Text("• \(ingredient.name.capitalized): \(ingredient.measure)")
                            .padding(.horizontal, 16)
                    }

                    Spacer()

                    // Display instructions
                    Text("Instructions:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(mealDetails.strInstructions)
                        .font(.body)
                        .padding(.horizontal, 16)
                } else {
                    EmptyView()
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(mealDetailsModel.mealDetails.first?.strMeal.capitalized ?? "Meal Details")
        .onAppear {
            if let mealID = mealID {
                mealDetailsModel.fetchMeals(mealID: mealID)
            }
        }
    }
}

struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView(mealID: "52918")
    }
}
