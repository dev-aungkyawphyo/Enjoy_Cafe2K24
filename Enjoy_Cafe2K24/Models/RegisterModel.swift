//
//  RegisterModel.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 10/10/2024.
//

import Foundation
import UIKit

struct RegisterInput {
    let name: String
    let phoneNo: String
    let password: String
    let confirmPassword: String
    let profilePhoto: UIImage?
}

struct RegisterRequest {
    let name: String
    let phone: String
    let password: String
    let confirmPassword: String
    let profile: Data
    
    enum CodingKeys: String, CodingKey {
        case confirmPassword = "confirm_password"
        case phone, password, name, profile
    }
}
