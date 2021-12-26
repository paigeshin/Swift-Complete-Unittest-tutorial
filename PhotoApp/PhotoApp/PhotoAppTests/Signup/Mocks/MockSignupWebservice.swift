//
//  MockSignupWebservice.swift
//  PhotoApp
//
//  Created by paige on 2021/12/26.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled = false
    var shouldRetrunError = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldRetrunError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not succesful"))
        } else {
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
        
    }
    
}
