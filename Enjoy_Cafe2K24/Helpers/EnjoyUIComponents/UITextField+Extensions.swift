//
//  UITextField+Extensions.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 09/10/2024.
//

import UIKit

extension UITextField {
    
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(1)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,
                              width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    var inputValue: String {
        self.text ?? ""
    }
    
}


