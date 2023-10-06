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
    var selectedMeal: Meal?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if meal == selectedMeal {
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
                    .frame(maxWidth: meal == selectedMeal ? .infinity : 50, maxHeight: meal == selectedMeal ? .infinity : 50)
                    .cornerRadius(8)
                
                if !(meal == selectedMeal) {
                    TitleStack(title: meal.strMeal, subtitle: meal.strCategory)
                    Spacer()
                }
            }
            
            if meal == selectedMeal {
                HStack {
                    Spacer()
                    NavigationLink(destination: MealDetailsView(meal: meal)) {
                        Text("Details")
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                    }
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
