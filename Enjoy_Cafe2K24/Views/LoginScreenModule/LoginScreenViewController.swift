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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}
