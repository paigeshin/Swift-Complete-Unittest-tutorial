//
//  TetingMethodsThatThrowErrorTests.swift
//  TetingMethodsThatThrowErrorTests
//
//  Created by paige on 2021/12/26.
//

import XCTest
@testable import TetingMethodsThatThrowError

class TetingMethodsThatThrowErrorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError() {
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act and Assert
        XCTAssertThrowsError(try sut.isFirstNameValid("Paige*"), "The isFirstNameValid() should have thrown an error if user's first name contains illigal characters") { errorThrown in

            XCTAssertEqual(errorThrown as? SignupError, SignupError.illigalCharactersFound)
            
        }
        
        do {
            let _ = try sut.isFirstNameValid("Paige*")
            XCTFail("The isFirstNameValid() was supposed to throw an error when illiegal characters used in User's first name")
        } catch SignupError.illigalCharactersFound {
            // Successfully passing
            return
        } catch {
            XCTFail("The isFirstNameValid() was supposed to throw the SignupError.illigalCharactersFound Error when illigal characters used. A different Error was thrown.")
            return
        }
        
    }
    
    func testFirstNameValidation_WhenValidCharacters_ThrowsNoErrors() {
        // Assert
        let sut = SignupFormModelValidator()
        
        // Act
        XCTAssertNoThrow(try sut.isFirstNameValid("Paige"), "Thie isFirstNameValid() should not have thrown an error whene there are no illigal characters provided")
        
        do {
            let _ = try sut.isFirstNameValid("Paige")
        } catch {
            XCTFail("The isFirstNameValid() was not supposed to thrnow an Error when a valid First Name value was provided")
        }
        
    }
}
