//
//  AccountView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//

import SwiftUI

// MARK: Account View
struct AccountView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var password2 = ""

    @StateObject private var accountModel = AccountModel() // Create an instance of AccountModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Spacer()

                // MARK: - Header Section
                HStack {
                    Text(accountModel.isSignIn ? "Sign In" : "Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.black)

                    Spacer()

                    Button(!accountModel.isSignIn ? "Sign In?" : "Sign Up?") {
                        accountModel.isSignIn.toggle()
                        resetView()
                    }
                }

                // MARK: - Text Fields Section
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if !accountModel.isSignIn {
                    SecureField("Confirm Password", text: $password2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                // MARK: - Error Message and Buttons Section
                HStack(alignment: .center) {
                    Text(accountModel.errorMessage)
                        .foregroundColor(.orange)

                    Spacer()

                    if accountModel.isSignIn {
                        // Sign In button
                        Button("Sign In") {
                            accountModel.signIn(username: username, password: password)
                        }
                        .background(.orange)
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .cornerRadius(8)
                    } else if password2 != "", password == password2 {
                        // Sign Up button
                        Button("Sign Up") {
                            accountModel.signUp(username: username, password: password)
                        }
                        .background(.orange)
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .cornerRadius(8)
                    }
                }

                Spacer()
            }
            .onAppear {
                accountModel.isSignIn = true
                resetView()
            }
            .padding()
            .background(
                NavigationLink(
                    destination: MealView(),
                    isActive: .constant(accountModel.isSuccessSignIn),
                    label: { EmptyView() }
                )
                .opacity(0)
            )

        }
        .tint(.orange)
    }

    // Function to reset the view
    func resetView() {
        // Reset the View
        accountModel.isSuccessSignIn = false
        accountModel.errorMessage = ""

        username = ""
        password = ""
        password2 = ""
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
