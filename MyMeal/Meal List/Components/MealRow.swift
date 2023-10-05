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
    @State private var mealImage: UIImage?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                ZStack {
                    KFImage(URL(string: meal.strMealThumb))
                        .resizable()
                        .placeholder {
                            DefaultImage()
                        }
                        .cancelOnDisappear(true)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: meal == selectedMeal ? .infinity : 50, height: meal == selectedMeal ? .infinity : 50)
                        .clipped()
                }
                .cornerRadius(8)
                
                if !(meal == selectedMeal) {
                    TitleStack(title: meal.strMeal, subtitle: meal.strCategory)
                }
            }
            
            if meal == selectedMeal {
                TitleStack(title: meal.strMeal, subtitle: meal.strCategory)
            }
        }
        .padding(8)
        .onTapGesture {
            selectedMeal = meal
        }
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
        }
    }
}
