//
//  RegisterViewModel.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 10/10/2024.
//

import Foundation

protocol RegisterViewModelInputs: AnyObject {
    func clickedProfileButton()
    func clickedRegisterButton(input: RegisterInput)
}

protocol RegisterViewModelOutputs: AnyObject {
    var isInValid: ((Error) -> Void)? { get set }
}

protocol RegisterViewModelType {
    var inputs: RegisterViewModelInputs { get }
    var outputs: RegisterViewModelOutputs { get }
}

final class RegisterViewModel: RegisterViewModelInputs, RegisterViewModelOutputs, RegisterViewModelType {
    
    // MARK: - LoginViewModelType
    var inputs: RegisterViewModelInputs { return self }
    var outputs: RegisterViewModelOutputs { return self }
    
    //  MARK: - Custom Initializers
    let validationService = ValidationService.shared
    
    /// validation Flag
    var isInvalidInput: Bool = false
    
    // MARK: - LoginViewModelInputs
    func clickedProfileButton() {
        
    }
    
    func clickedRegisterButton(input: RegisterInput) {
        inputValidation(input: input)
    }
    
    // MARK: - LoginViewModelOutputs
    var isInValid : ((Error) -> Void)?
    
    func inputValidation(input: RegisterInput) {
        isInvalidInput = false
        
        /// Validation Check
        validateName(input.name)
        validatePhoneNo(input.phoneNo)
        validatePassword(input.password)
        validateConfirmPassword(input.confirmPassword)
        validateComparePasswords(password: input.password, confirmPassword: input.confirmPassword)
        
        guard !isInvalidInput else { return }
    }
    
    func validateName(_ userName: String?) {
        switch validationService.isValidName(name: userName) {
        case .failure(let error):
            validateFail(error: error)
        default:
            break
        }
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
    
    private func validateConfirmPassword(_ confirmPassword: String?) {
        switch validationService.isValidPassword(passwordType: .confirmPassword, password: confirmPassword) {
        case .failure(let error):
            validateFail(error: error)
        default:
            break
        }
    }
    
    private func validateComparePasswords(password: String? , confirmPassword: String?) {
        switch validationService.comparePasswords(password: password, confirmPassword: confirmPassword) {
        case .failure(let errror):
            validateFail(error: errror)
        default:
            break
        }
    }
    
    private func validateFail(error: Error) {
        isInvalidInput = true
        self.isInValid?(error)
    }
    
}

