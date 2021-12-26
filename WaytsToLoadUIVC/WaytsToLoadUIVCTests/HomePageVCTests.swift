//
//  HomePageVCTests.swift
//  WaytsToLoadUIVCTests
//
//  Created by paige on 2021/12/26.
//

import XCTest
@testable import WaytsToLoadUIVC

class HomePageVCTests: XCTestCase {

    var sut: HomePageVC!
 
    override func setUpWithError() throws {
        sut = HomePageVC()
        sut.loadViewIfNeeded()
    }
    
}
