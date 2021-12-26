//
//  MockSignupViewDelegate.swift
//  PhotoApp
//
//  Created by paige on 2021/12/26.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SingupViewDelegateProtocol {

    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: SignupError?
    
    func successfulSignup() {
        successfulSignupCounter += 1 
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
}
