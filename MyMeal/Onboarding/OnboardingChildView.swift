//
//  OnboardingChildView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 06/10/23.
//

import SwiftUI

struct OnboardingChildView: View {
    var data: OnboardingData

    @State private var showImageA = true // Toggle between the two images

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                ZStack {
                    if showImageA {
                        Image(data.backgroundImageA)
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(data.backgroundImageB)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .task {
                    // Start the image animation when the view appears
                    print("page loaded for data ", data.id)

                    showImageA = true
                    withAnimation(Animation.linear(duration: 1).delay(1.5)) {
                        showImageA = false
                    }
                }

                Spacer()
                Spacer()

                Text(data.text)
                    .font(.title2)
                    .bold()

                Spacer()

                if data.id == 2 {
                    NavigationLink(destination: AccountView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor( .orange)
                            )
                    }
                }

                Spacer()
                Spacer()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingChildView(data: OnboardingData.list.last!)
    }
}
