//
//  EnjoyImageView.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 09/10/2024.
//

import UIKit

@IBDesignable
class EnjoyImageView: UIImageView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}

