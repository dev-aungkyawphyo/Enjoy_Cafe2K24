//
//  UICollectionView+Extensions.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 13/10/2024.
//

import Foundation
import UIKit

extension UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionView {
    
    func registerCell(type: UICollectionViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueCell<T: UICollectionViewCell>(withType type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
}

extension UICollectionViewLayout {
    
    static var productLayout: UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 25, height: UIScreen.main.bounds.width / 1.9)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = .zero
        return layout
    }
    
}
