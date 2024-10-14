//
//  UISearchBar+Extensions.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 13/10/2024.
//

import Foundation
import UIKit

extension UISearchBar {
    
    func searchBarStyle() {
        self.searchTextField.backgroundColor = .appColor(.searchBarBGColor)
        self.searchTextField.textColor = .lightGray
        self.tintColor = .lightGray
        self.searchTextField.borderStyle = .none
        self.searchTextField.layer.cornerRadius = 10
        self.searchTextField.layer.masksToBounds = true
        self.searchTextField.leftView?.tintColor = .lightGray
        self.placeholder = "Search"
    }
    
}
