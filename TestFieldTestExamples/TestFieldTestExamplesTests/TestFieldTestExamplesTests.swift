//
//  TestFieldTestExamplesTests.swift
//  TestFieldTestExamplesTests
//
//  Created by paige on 2021/12/27.
//

import XCTest
@testable import TestFieldTestExamples

class TestFieldTestExamplesTests: XCTestCase {
    
    var sut: SignupViewController!

    override func setUpWithError() throws {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        
        sut.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
    
        sut = nil
        
    }

    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
        
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress, "Email address UITextField does not have an Email Address Content Type Set")
        
    }
    
    func testEmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws {
        
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
    
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress, "Email Address UITextField does not have Email Keyboard type set")
    
    }

    func testPasswordTextField_WhenCreated_IsSecureTextEntryField() throws {
        
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The Password UITextField is not connected")
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password UITextField is not a Secure Text Entry Field")
        
    }
    
}
