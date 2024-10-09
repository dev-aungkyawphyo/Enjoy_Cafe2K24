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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}
