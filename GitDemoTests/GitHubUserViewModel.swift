//
//  GitHubUserViewModel.swift
//  GitDemoTests
//
//  Created by Mikhail Kolkov on 14.01.21.

import XCTest
@testable import GitDemo

class GitHubUserViewModel: XCTestCase {
    
    var userViewModel = GithubUserViewModel()
        
    func testGetDetailsPositive() {
        userViewModel.fetchGitHubUserData { (item) in
            XCTAssertNotNil(item)
        }
     }
    
    func testExample() {
        let btn = UINavigationController()
        btn.barTintColor = UIColor.red
        XCTAssertEqual(UIColor(cgColor: btn.barTintColor?.cgColor ?? UIColor.red as! CGColor), UIColor.red, "borderColor")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
