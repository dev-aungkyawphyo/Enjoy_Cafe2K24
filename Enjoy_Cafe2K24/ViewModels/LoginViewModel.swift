//
//  LoginViewModel.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 10/10/2024.
//

import Foundation

protocol LoginViewModelInputs: AnyObject {
    func clickedLoginButton(input: LoginInput)
    func clickedRegisterButton()
}

protocol LoginViewModelOutputs: AnyObject {
    var isInvalid: ((Error) -> Void)? { get set }
}

protocol LoginViewModelType {
    var inputs: LoginViewModelInputs { get }
    var outputs: LoginViewModelOutputs { get }
}

final class LoginViewModel: LoginViewModelInputs, LoginViewModelOutputs, LoginViewModelType {
    
    // MARK: - LoginViewModelType
    var inputs: LoginViewModelInputs { return self }
    var outputs: LoginViewModelOutputs { return self }
    
    // MARK: - Custom Initializers
    let validationService = ValidationService.shared
    
    /// Validation Flag
    var isInvalidInput: Bool = false
    
    // MARK: - LoginViewModelInputs
    func clickedLoginButton(input: LoginInput) {
        inputValidation(input: input)
    }
    
    // MARK: - RegisterViewModelInputs
    func clickedRegisterButton() {
        // TODO: input validation
    }
    
    // MARK: - LoginViewModelOutputs
    var isInvalid: ((Error) -> Void)?
    
    func inputValidation(input: LoginInput) {
        isInvalidInput = false
        /// Validation Check
        validatePhoneNo(input.phoneNo)
        validatePassword(input.password)
        
        guard !isInvalidInput else { return }
    }
    
    private func validatePhoneNo(_ phoneNo: String?) {
        switch validationService.isValidPhoneNo(phoneNo: phoneNo) {
        case .failure(let error):
            validateFail(error: error)
        default:
            break
        }
    }
    
    private func validatePassword(_ password: String?) {
        switch validationService.isValidPassword(passwordType: .normalPassword, password: password) {
        case .failure(let error):
            validateFail(error: error)
        default:
            break
        }
    }
    
    private func validateFail(error: Error) {
        isInvalidInput = true
        self.isInvalid?(error)
    }
    
}
