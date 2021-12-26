//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by paige on 2021/12/26.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SingupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
