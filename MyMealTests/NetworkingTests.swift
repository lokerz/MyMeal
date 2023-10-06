//
//  NetworkingTests.swift
//  MyMealTests
//
//  Created by Ridwan Abdurrasyid on 06/10/23.
//

import XCTest
import Alamofire
@testable import MyMeal

class NetworkingPerformanceTests: XCTestCase {
    // This test measures the performance of a network request
    func testNetworkingPerformance() {
        // Define the API URL to test
        let apiUrl = "https://www.themealdb.com/api/json/v1/1/search.php?f=A"

        // Use the `measure` function to measure performance
        measure {
            // Create an expectation to wait for the network request to complete
            let expectation = XCTestExpectation(description: "Networking Test")

            // Perform a network request using Alamofire
            AF.request(apiUrl).responseDecodable(of: MealListResponse.self) { response in
                switch response.result {
                case .success(let mealListResponse):
                    // Assert that the response contains data (meals)
                    XCTAssertFalse(mealListResponse.meals.isEmpty)
                    // Fulfill the expectation to indicate that the test is complete
                    expectation.fulfill()

                case .failure(let error):
                    // If there's a networking error, fail the test
                    XCTFail("Networking error: \(error)")
                }
            }

            // Wait for the expectation to be fulfilled within a specified timeout
            wait(for: [expectation], timeout: 10.0)
        }
    }
}
