//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by paige on 2021/12/26.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {

    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    private var delegate: SingupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SingupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }

    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: SignupError.invalidFirstName)
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: SignupError.invalidLastName)
            return 
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            delegate?.errorHandler(error: SignupError.invalidEmail)
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            delegate?.errorHandler(error: SignupError.passwordsDoNotMatch)
            return 
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
//        self.delegate?.successfulSignup()
        
        webservice.signup(withForm: requestModel) { [weak self] responseModel, error in

            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }

            if let _ = responseModel {
                self?.delegate?.successfulSignup()
                return
            }
        }
        
    }
    
}
