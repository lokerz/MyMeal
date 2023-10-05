import SwiftUI

struct AlphabetButtonsView: View {
    // Observable object to fetch meal data
    @ObservedObject var mealModel: MealModel

    // Alphabet Buttons Array        
    let alphabetLetters: [Character] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // Generate buttons for each letter from A to Z
                ForEach(alphabetLetters, id: \.self) { letter in
                    Button(action: {
                        // Set the selected letter and fetch meals
                        mealModel.selectedLetter = letter
                        mealModel.fetchMeals()
                    }) {
                        // Button appearance
                        Text(String(letter))
                            .font(.headline)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(mealModel.selectedLetter == letter ? .orange : .gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
