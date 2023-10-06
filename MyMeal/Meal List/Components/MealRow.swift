//
//  MealRow.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 04/10/23.
//

import SwiftUI
import Kingfisher

// MARK: Meal Row
struct MealRow: View {
    let meal: Meal // The meal to display in this row
    @Binding var selectedMeal: Meal? // Binding to track the selected meal

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if selectedMeal == meal {
                // Upper Title
                TitleStack(title: meal.strMeal, subtitle: meal.strCategory)
            }

            HStack(spacing: 16) {
                // Display the meal's image using Kingfisher
                KFImage(URL(string: meal.strMealThumb))
                    .resizable()
                    .placeholder {
                        DefaultImage()
                    }
                    .cancelOnDisappear(true)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: selectedMeal == meal ? .infinity : 50,
                           maxHeight: selectedMeal == meal ? .infinity : 50)
                    .cornerRadius(8)
                    .onTapGesture {
                        withAnimation {
                            selectedMeal = meal
                        }
                    }
                    .allowsHitTesting(selectedMeal != meal)

                if !(selectedMeal == meal) {
                    // Side Title
                    TitleStack(title: meal.strMeal, subtitle: meal.strCategory)
                    Spacer()
                }
            }
        }
        .padding(8)
    }
}

// MARK: TitleStack: A view for displaying the title and subtitle of a meal.
struct TitleStack: View {
    var title: String?
    var subtitle: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text(title?.capitalized ?? "")
                .font(.headline)

            Text(subtitle ?? "")
                .font(.subheadline)
                .foregroundColor(.orange)
        }
    }
}
