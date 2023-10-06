//
//  OnboardingView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 06/10/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentTab = 0

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: AccountView()) {
                        Text("Skip")
                            .fontWeight(.medium)
                            .foregroundColor(.orange)
                    }
                }
                .padding()

                TabView(selection: $currentTab,
                        content: {
                    ForEach(OnboardingData.list) { viewData in
                        OnboardingChildView(data: viewData)
                            .tag(viewData.id)
                    }
                })
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))

                Spacer()
            }
            .navigationBarTitleDisplayMode(.large)
        }
        .tint(.orange)
    }
}

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let backgroundImageA: String
    let backgroundImageB: String
    let text: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0, backgroundImageA: "OnboardingA", backgroundImageB: "OnboardingB", text: "Tap or Swipe to see the next Alphabetical Meals."),
        OnboardingData(id: 1, backgroundImageA: "OnboardingB", backgroundImageB: "OnboardingC", text: "Tap the picture to see the Meal bigger."),
        OnboardingData(id: 2, backgroundImageA: "OnboardingC", backgroundImageB: "OnboardingD", text: "Tap the meal to see how to cook it.")
    ]
}
