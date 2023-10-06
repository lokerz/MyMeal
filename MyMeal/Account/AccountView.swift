//
//  AccountView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//

import SwiftUI

struct AccountView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var password2 = ""
    
    // Create an instance of AccountModel
    @StateObject private var accountModel = AccountModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                
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
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !accountModel.isSignIn {
                    SecureField("Confirm Password", text: $password2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack(alignment: .center) {
                    Text(accountModel.errorMessage)
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    if accountModel.isSignIn {
                        Button("Sign In") {
                            accountModel.signIn(username: username, password: password)
                        }
                        .background(.orange)
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .cornerRadius(8)
                    } else if password2 != "", password == password2 {
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
