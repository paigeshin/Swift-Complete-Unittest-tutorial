//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by paige on 2021/12/26.
//

import Foundation

protocol SingupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
