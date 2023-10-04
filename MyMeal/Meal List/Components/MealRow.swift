//
//  MealRow.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 04/10/23.
//

import SwiftUI

struct MealRow: View {
    let meal: Meal
    
    var body: some View {
        HStack {
            // Display the meal's image (you can use `URLImage` or `Image` view)
            // Example:
            // URLImage(url: meal.strMealThumb, placeholder: Image(systemName: "photo"))
            //   .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(meal.strMeal)
                    .font(.headline)
                
                Text(meal.strCategory)
                    .font(.subheadline)
            }
        }
        .padding(8)
    }
}
