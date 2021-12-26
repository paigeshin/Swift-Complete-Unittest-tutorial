//
//  WaytsToLoadUIVCTests.swift
//  WaytsToLoadUIVCTests
//
//  Created by paige on 2021/12/26.
//

import XCTest
@testable import WaytsToLoadUIVC

class WaytsToLoadUIVCTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded() //trigger viewDidLoad()
    }
    
}
