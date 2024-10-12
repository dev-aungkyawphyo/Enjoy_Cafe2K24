//
//  RegisterScreenViewController.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 10/10/2024.
//

import UIKit

class RegisterScreenViewController: EnjoyViewController {

    // MARK: - IBOutlets
    @IBOutlet var textFieldCollection: [EnjoyTextField]!
    @IBOutlet var errorLabelCollection: [UILabel]!
    
    @IBOutlet weak var nameTextField: EnjoyTextField!
    @IBOutlet weak var phoneNoTextField: EnjoyTextField!
    @IBOutlet weak var passwordTextField: EnjoyTextField!
    @IBOutlet weak var confirmPasswordTextField: EnjoyTextField!
    
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var phoneNoErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    
    @IBOutlet weak var profileImageView: EnjoyImageView!
    
    var viewModel: RegisterViewModel?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
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
        
    }
    
    // MARK: - User Interaction - Actions & Targets
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func profileBtnAction(_ sender: UIButton) {
        debugPrint("choose image from photos")
    }
    
    @IBAction func registerBtnAction(_ sender: EnjoyButton) {
        debugPrint("present to another view")
        // TODO: user action & target
    }
    
}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension RegisterScreenViewController: UITextFieldDelegate {
    
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
