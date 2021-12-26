//
//  TestNavigationTests.swift
//  TestNavigationTests
//
//  Created by paige on 2021/12/27.
//

import XCTest
@testable import TestNavigation

class TestNavigationTests: XCTestCase {

    var sut: ViewController!
    var navigatonController: UINavigationController!
    
    override func setUpWithError() throws {
        
        // Step 1. Create an instance of UIStoryboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Step 2. Instantiate UIViewController with Storyboard ID
        sut = storyboard.instantiateViewController(withIdentifier: "VC") as? ViewController
        
        // Step 3. Make the viewDidLoad() execute.
        sut.loadViewIfNeeded()
        navigatonController = UINavigationController(rootViewController: sut)
        
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        navigatonController = nil
        
    }
    
    func testNextViewButton_WhenTapped_SecondViewControllerIsPushed() {
        
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SecondVC
        }
        
        _ = expectation(for: myPredicate, evaluatedWith: navigatonController)
        
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 1.5) // much longer seconds
        
    }
    
    // Recommended way to test navigation controller
    func testNextViewButton_WhenTapped_SecondViewControllerIsPushed_V2() {
    
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        // Using Run Loop
        RunLoop.current.run(until: Date())
        
        guard let _ = navigatonController.topViewController as? SecondVC else {
            XCTFail()
            return
        }
        
    }
    
    // with spy navigation controller
    func testNextViewButton_WhenTapped_SecondViewControllerIsPushed_V3() {
        let spyNavigationController = SpyNavigationController(rootViewController: sut)
        
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavigationController.pushedViewController as? SecondVC else {
            XCTFail()
            return
        }
        
    }
    
    
}

class SpyNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }
    
}
