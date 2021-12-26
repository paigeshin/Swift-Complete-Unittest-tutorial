//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by paige on 2021/12/25.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signUp: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        app = XCUIApplication()
        
        // MARK: SETUP LAUNCH ARGUMENTS
        app.launchArguments = ["-skipSurvey", "-debugServer"]
        
        // MARK: SETUP LAUNCH ENVIRONMENT
        app.launchEnvironment = ["signupUrl": "http://appsdeveloperblog.com/api/v2/signup-mock-service/users",
                                 "inAppPurcahsesEnabled": "true",
                                 "inAppAdsEnabled": "true"]
        
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signUp = app.buttons["signupButton"]
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signUp = nil
        try super.tearDownWithError()
    }
    
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        
        // Accessing UI Elements #1
//        let element = app
//            .children(matching: .window)
//            .element(boundBy: 0)
//            .children(matching: .other)
//            .element
//            .children(matching: .other)
//            .element
//            .children(matching: .other)
//            .element
//        element.children(matching: .textField).element(boundBy: 0).tap()
//        element.children(matching: .textField).element(boundBy: 1).tap()
//        element.children(matching: .textField).element(boundBy: 2).tap()
//        element.children(matching: .textField).element(boundBy: 3).tap()
//        element.children(matching: .textField).element(boundBy: 4).tap()
//        app.staticTexts["Signup"].tap()
        
        // Accessing UI Elements with placeholder #2
//        app.textFields["First name:"].tap()
//        app.textFields["Last name:"].tap()
//        app.textFields["Email:"].tap()
//        app.textFields["Password:"].tap()
//        app.textFields["Repeat password:"].tap()
//        app.staticTexts["Signup"].tap()
        
        // Accessing UI Elements with placeholder #3
//        let firstName = app.textFields["First name:"]
//        let lastName = app.textFields["Last name:"]
//        let email = app.textFields["Email:"]
//        let password = app.secureTextFields["Password:"]
//        let repeatPassword = app.secureTextFields["Repeat password:"]
//        let signUp = app.buttons["Signup"]
//
//        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
//        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
//        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
//        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
//        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
//        XCTAssertTrue(signUp.isEnabled, "The Signup button is not enabled for user interactions")
        
        // Accessing UI Elements with accessiblity #4
//        let firstName = app.textFields["firstNameTextField"]
//        let lastName = app.textFields["lastNameTextField"]
//        let email = app.textFields["emailTextField"]
//        let password = app.secureTextFields["passwordTextField"]
//        let repeatPassword = app.secureTextFields["repeatPasswordTextField"]
//        let signUp = app.buttons["signupButton"]

        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
        XCTAssertTrue(signUp.isEnabled, "The Signup button is not enabled for user interactions")
        
        // Use recordings to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results
        
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        // Arrange
        let firstName = app.textFields["firstNameTextField"]
        firstName.tap()
        firstName.typeText("S")
        
        let lastName = app.textFields["lastNameTextField"]
        lastName.tap()
        lastName.typeText("K")
        
        let email = app.textFields["emailTextField"]
        email.tap()
        email.typeText("@")
        
        let password = app.secureTextFields["passwordTextField"]
        password.tap()
        password.typeText("123456")
        
        let repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        let signUp = app.buttons["signupButton"]
        
        // Act
        signUp.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup from was submitted")
    }
    
    func testViewController_ValidFormSubmitted_PresentsSuccessAlertDialog() {
        // Arrange
        let firstName = app.textFields["firstNameTextField"]
        firstName.tap()
        firstName.typeText("Paige")
        
        let lastName = app.textFields["lastNameTextField"]
        lastName.tap()
        lastName.typeText("Shin")
        
        let email = app.textFields["emailTextField"]
        email.tap()
        email.typeText("paigeshin1991@gmail.com")
        
        let password = app.secureTextFields["passwordTextField"]
        password.tap()
        password.typeText("12345678")
        
        let repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        let signUp = app.buttons["signupButton"]
        
        // Act
        signUp.tap()
        
        // Attach screenshot programmatically
        let emailTextFieldScreenshot = email.screenshot()
        let emailTextFieldAttachment = XCTAttachment(screenshot: emailTextFieldScreenshot)
        emailTextFieldAttachment.name = "Screenshot of Email UITextField"
        emailTextFieldAttachment.lifetime = .keepAlways
        add(emailTextFieldAttachment)
        
//        let currentAppWindow = app.screenshot()
        let currentAppWindow = XCUIScreen.main.screenshot()
        let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindow)
        currentAppWindowAttachment.name = "Signup page screenshot"
        currentAppWindowAttachment.lifetime = .keepAlways
        add(currentAppWindowAttachment)
        
        
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "A Success Alert dialog was not presented when valid signup from was submitted")
    }
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    

}
