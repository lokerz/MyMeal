//
//  MealView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//

import SwiftUI

// MARK: Meal View
struct MealView: View {
    @StateObject var mealModel = MealModel()

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // Environment Variable to access Back Navigation

    var body: some View {
        VStack {
            // MARK: Upper Section
            // Alphabet buttons for selecting the initial letter
            AlphabetButtonsView(mealModel: mealModel)

            Spacer(minLength: 20)

            // MARK: Lower Section: List of meals or loading view
            if mealModel.isLoading {
                LoadingView() // Display the loading view
            } else {
                if mealModel.meals.isEmpty {
                    EmptyView()
                } else {
                    List(mealModel.meals, id: \.idMeal) { meal in
                        NavigationLink(destination: MealDetailsView(mealID: meal.idMeal)) {
                            MealRow(meal: meal, selectedMeal: $mealModel.selectedMeal)
                        }
                    }
                }
            }
        }
        .navigationTitle("Meals")
        .navigationBarBackButtonHidden()
        .onAppear {
            // Fetch data when the view appears
            mealModel.fetchMeals()
        }
        .gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.width > 0 && mealModel.selectedLetter != "A" {
                        // Swipe right to the previous letter
                        mealModel.fetchPreviousMeals()
                    } else if value.translation.width < 0 && mealModel.selectedLetter != "Z" {
                        // Swipe left to the next letter
                        mealModel.fetchNextMeals()
                    }
                }
        )
        .tint(.orange)
        .toolbar {
            LogoutToolbar {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}

// MARK: Logout Toolbar
struct LogoutToolbar: ToolbarContent {
    var completion: (() -> Void)?
    @State var isLogoutPromptVisible = false
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                isLogoutPromptVisible.toggle()
            }) {
                Image(systemName: "person.circle.fill")
                    .imageScale(.large)
            }
            .alert(isPresented: $isLogoutPromptVisible) {
                // Logout Alert Prompt
                Alert(
                    title: Text("Logout"),
                    message: Text("Are you sure you want to logout?"),
                    primaryButton: .destructive(Text("Logout")) {
                        // Handle logout action here
                        completion?()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
