//
//  LoadingView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 04/10/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .padding()
                .frame(maxHeight: .infinity)
        }
    }
}
