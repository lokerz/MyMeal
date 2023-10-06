//
//  MealModelTests.swift
//  MyMealTests
//
//  Created by Ridwan Abdurrasyid on 06/10/23.
//

import XCTest
import Alamofire
@testable import MyMeal

class MealModelTests: XCTestCase {
    var mealModel: MealModel!
    var mealDetailsModel: MealDetailsModel!

    override func setUp() {
        super.setUp()
        mealModel = MealModel()
        mealDetailsModel = MealDetailsModel()
    }

    override func tearDown() {
        mealModel = nil
        mealDetailsModel = nil
        super.tearDown()
    }

    // This test measures the performance of fetching meals
    func testFetchMealsPerformance() {
        // Create an expectation to wait for the network request to complete
        let expectation = XCTestExpectation(description: "Fetch Meals")

        // Measure the performance of fetching meals
        measure {
            mealModel.fetchMeals()

            // Use DispatchQueue to wait for a specified duration (5 seconds in this case)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                // Assert that the fetched meals are not empty
                XCTAssertFalse(self.mealModel.meals.isEmpty)

                // Fulfill the expectation to indicate that the test is complete
                expectation.fulfill()
            }
        }

        // Wait for the expectation to be fulfilled within a specified timeout (10 seconds in this case)
        wait(for: [expectation], timeout: 10.0)
    }

    // This test measures the performance of fetching meal detailss
    func testFetchMealDetailssPerformance() {
        // Create an expectation to wait for the network request to complete
        let expectation = XCTestExpectation(description: "Fetch Meal Details")

        // Measure the performance of fetching meals
        measure {
            mealDetailsModel.fetchMeals(mealID: "52772")

            // Use DispatchQueue to wait for a specified duration (5 seconds in this case)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                // Assert that the fetched meals are not empty
                XCTAssertFalse(self.mealDetailsModel.mealDetails.isEmpty)

                // Fulfill the expectation to indicate that the test is complete
                expectation.fulfill()
            }
        }

        // Wait for the expectation to be fulfilled within a specified timeout (10 seconds in this case)
        wait(for: [expectation], timeout: 10.0)
    }
}
