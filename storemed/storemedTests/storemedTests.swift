//
//  storemedTests.swift
//  storemedTests
//
//  Created by pragmus on 25/07/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import XCTest
@testable import storemed

class storemedTests: XCTestCase {

    var api = MedicalSuppliesApi()
    
    override func setUp() {
        App.shared.loadConfig()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMedicalSuppliesApiAlive() {
        let expectation = self.expectation(description: "Is api alive?")
        
        let filter = Filter()
        
        let _ = api.loadMedicalSupplies(page: 1, filter: filter, success: { (page) in
            print("success")
            print(page as Any)
            XCTAssertNotNil(page)
            expectation.fulfill()
        }) { (error) in
            print("fail")
            XCTFail(error.localizedDescription)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 100)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
