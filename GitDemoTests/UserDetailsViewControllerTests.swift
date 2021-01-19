//
//  UserDetailsViewControllerTests.swift
//  GitDemoTests
//
//  Created by Mikhail Kolkov on 14.01.21.

import XCTest
@testable import GitDemo

class UserDetailsViewControllerTests: XCTestCase {

    var userVC = UserDetailsViewController()

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFirst() {
        let _ = userVC.view
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
