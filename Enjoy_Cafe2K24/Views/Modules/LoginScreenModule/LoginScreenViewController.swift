//
//  LoginScreenViewController.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 09/10/2024.
//

import UIKit

class LoginScreenViewController: EnjoyViewController {

    // MARK: - IBOutlets
    @IBOutlet var textFieldCollection: [EnjoyTextField]!
    @IBOutlet var errorLabelCollection: [UILabel]!
    
    @IBOutlet weak var phoneNoTextField: EnjoyTextField!
    @IBOutlet weak var passwordTextField: EnjoyTextField!
    
    @IBOutlet weak var phoneNoErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var viewModel: LoginViewModel?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        setupTextField()
        binding()
    }
    
    private func setupTextField() {
        textFieldCollection.forEach({
            $0.delegate = self
        })
    }
    
    private func binding() {
        viewModel = LoginViewModel()
        viewModel?.outputs.isInvalid = { [weak self] errorMessage in
            if let error = errorMessage as? PhoneNoValidationError {
                self?.phoneNoErrorLabel.text = error.rawValue
                return
            }
            if let error = errorMessage as? PasswordValidationError {
                self?.passwordErrorLabel.text =  error.rawValue
            }
        }
    }
    
    // MARK: - User Interaction - Actions & Targets
    @IBAction func forgotPasswordBtnAction(_ sender: UIButton) {
        // TODO: Actions & Targets
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        let registerVC = RegisterScreenViewController.instantiate(storyboard: .register)
        registerVC.modalTransitionStyle = .crossDissolve
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
    
    @IBAction func loginBtnAction(_ sender: EnjoyButton) {
        if (viewModel?.inputs.clickedLoginButton(input: .init(phoneNo: phoneNoTextField.inputValue,
                                                           password: passwordTextField.inputValue))) != nil {
            if phoneNoTextField.text == "9764374935" && passwordTextField.text == "12345678" {
                let vc = EnjoyTabBarViewController.instantiate(storyboard: .baseRouter)
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
    }
    
}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textField = textField as? EnjoyTextField, let index = textFieldCollection.firstIndex(of: textField) {
            errorLabelCollection[index].text = ""
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == phoneNoTextField {
            phoneNoErrorLabel.text = ""
        } else {
            passwordErrorLabel.text = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textField = textField as? EnjoyTextField, let index = textFieldCollection.firstIndex(of: textField) else {
            return true
        }
        guard index < textFieldCollection.count - 1 else {
            textFieldCollection[index].resignFirstResponder()
            return true
        }
        textFieldCollection[index + 1].becomeFirstResponder()
        return true
    }
    
}
