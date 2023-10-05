//
//  MealRow.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 04/10/23.
//

import SwiftUI
import URLImage

struct MealRow: View {
    let meal: Meal
    
    var body: some View {
        HStack(spacing: 16) {
            URLImage(URL(string: meal.strMealThumb)!) { progress in
                DefaultImage()
            } failure: { error,retry in 
                DefaultImage()
            } content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(meal.strMeal.capitalized)
                    .font(.headline)
                
                Text(meal.strCategory)
                    .font(.subheadline)
            }
        }
        .padding(8)
    }
}
