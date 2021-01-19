//
//  ViewController.swift
//  GitDemoTests
//
//  Created by Mikhail Kolkov on 14.01.21.

import XCTest
@testable import GitDemo

let dataSourceDidSelectItemNotification = "DataSourceDidSelectItemNotification"

class ViewControllerTests: XCTestCase {

    var viewController = ViewController()
    var tableViewMock = UITableView()
    var selectedIndexPath: NSIndexPath?
    var dataSource: ViewController?
    var tableView: UITableView?
    var navController: UINavigationController?
    var postedNotification: NSNotification?

    override func setUp() {
        super.setUp()
        dataSource = viewController
        tableView = UITableView()
        viewController.tableView = tableView
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTableView() {
        guard let tableView = viewController.tableView else { return  }
        
        // Check the number of table rows
        XCTAssertEqual(nil, tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 3))
        
        // Check label text of the cell in the first row
        let indexPath = NSIndexPath(row: 3, section: 0)
        guard let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath as IndexPath) else { return }
        XCTAssertEqual("Test cell title", cell.textLabel!.text)
    }
    
    func didReceiveNotification(notification: NSNotification) {
           postedNotification = notification
       }
    
    
    func testThatMyMethodGetsCalled() {
        let alert = self.viewController.presentedViewController as? UIAlertController
        let action = alert?.actions[0]
        XCTAssertNil(action)
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
