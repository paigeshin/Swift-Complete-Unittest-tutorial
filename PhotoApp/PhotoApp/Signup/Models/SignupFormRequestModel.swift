//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by paige on 2021/12/25.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
