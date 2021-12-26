//
//  SignupFormValidator.swift
//  TetingMethodsThatThrowError
//
//  Created by paige on 2021/12/26.
//

import Foundation

class SignupFormModelValidator {
    
    private let invalidCharacters = CharacterSet(charactersIn: "{}$#%*&^.,/?!@")
    
    func isFirstNameValid(_ firstName: String) throws -> Bool {
        var returnValue = true
        
        // Check for illigal characters
        if firstName.rangeOfCharacter(from: invalidCharacters) != nil {
            throw SignupError.illigalCharactersFound
        }
        
        // Check first name
        if firstName.count < 2 || firstName.count > 10 {
            returnValue = false
        }
        
        return returnValue
    }
    
}
