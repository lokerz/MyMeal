//
//  DefaultImage.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//

import SwiftUI

struct DefaultImage: View {
    var body: some View {
        Image(systemName: "fork.knife.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
