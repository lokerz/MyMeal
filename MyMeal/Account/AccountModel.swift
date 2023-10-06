//
//  AccountModel.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//

import Foundation

struct User: Codable {
    var username: String
    var password: String
}

class AccountModel: ObservableObject {
    @Published var users: [User] = []
    @Published var currentUser: User?
    @Published var isSuccessSignIn = false
    @Published var isSignIn = true
    @Published var errorMessage = ""

    init() {
        loadUsers()
    }

    // Add a new user to the list.
    func signUp(username: String, password: String) {
        let newUser = User(username: username, password: password)
        users.append(newUser)
        saveUsers()
        errorMessage = ""
        isSignIn = true
    }
    
    // Sign in as registered user
    func signIn(username: String, password: String) {
        guard let user = users.first(where: { $0.username == username }) else {
            errorMessage = "User not found, please try other username."
            return
        }
        guard user.password == password else {
            errorMessage = "Wrong password, please try again."
            return
        }
        print(user)
        errorMessage = ""
        currentUser = user
        isSuccessSignIn = true
    }

    // Load users from UserDefaults.
    private func loadUsers() {
        if let userData = UserDefaults.standard.data(forKey: "users"),
           let decodedUsers = try? JSONDecoder().decode([User].self, from: userData) {
            users = decodedUsers
        }
    }

    // Save users to UserDefaults.
    private func saveUsers() {
        if let encodedData = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encodedData, forKey: "users")
        }
    }

    // Clear user data (for sign-out, etc.).
    func clearUserData() {
        currentUser = nil
    }
}
