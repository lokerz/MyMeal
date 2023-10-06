//
//  AccountModelTests.swift
//  MyMealTests
//
//  Created by Ridwan Abdurrasyid on 06/10/23.
//

import XCTest
@testable import MyMeal

class AccountModelTests: XCTestCase {
    var accountModel: AccountModel!

    override func setUp() {
        super.setUp()
        accountModel = AccountModel()
    }

    override func tearDown() {
        accountModel = nil
        super.tearDown()
    }

    // This test measures the performance of the signUp method
    func testSignUpPerformance() {
        // Define test username and password
        let username = "testuser"
        let password = "testpassword"

        // Measure the performance of the signUp method
        measure {
            accountModel.signUp(username: username, password: password)

            // Assert that the first user in the users array has the expected username
            XCTAssertEqual(accountModel.users.last?.username, username)
        }
    }

    // This test measures the performance of the signIn method
    func testSignInPerformance() {
        // Define test username and password
        let username = "testuser"
        let password = "testpassword"

        // Sign up the user first
        accountModel.signUp(username: username, password: password)

        // Measure the performance of the signIn method
        measure {
            accountModel.signIn(username: username, password: password)

            // Assert that the signIn was successful
            XCTAssertTrue(accountModel.isSuccessSignIn)
        }
    }
}
