//
//  LoadingViewControllerWithXIB.swift
//  WaytsToLoadUIVCTests
//
//  Created by paige on 2021/12/26.
//

import XCTest
@testable import WaytsToLoadUIVC

class LoadingViewControllerWithXIB: XCTestCase {
    
    var sut: XIBBasedViewController!

    override func setUpWithError() throws {
        sut = XIBBasedViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
