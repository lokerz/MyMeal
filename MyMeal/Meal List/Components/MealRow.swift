//
//  MealRow.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 04/10/23.
//

import SwiftUI
import Kingfisher

struct MealRow: View {
    let meal: Meal
    @Binding var selectedMeal: Meal?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if selectedMeal == meal {
                TitleStack(title: meal.strMeal, subtitle: meal.strCategory)
            }

            HStack(spacing: 16) {
                
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
                    TitleStack(title: meal.strMeal, subtitle: meal.strCategory)
                    Spacer()
                }
            }
        }
        .padding(8)
    }
}

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
