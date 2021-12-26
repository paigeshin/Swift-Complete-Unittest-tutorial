//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by paige on 2021/12/26.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void)
}
