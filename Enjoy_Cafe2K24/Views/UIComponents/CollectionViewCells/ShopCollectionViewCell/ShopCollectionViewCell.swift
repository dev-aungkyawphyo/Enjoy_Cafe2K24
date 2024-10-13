//
//  ShopCollectionViewCell.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 13/10/2024.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var customView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        customView.roundCorners(corners: [.topRight, .bottomLeft], radius: 20)
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = customView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        customView = blurEffectView
    }
    
    func configCell(content: Content) {
        shopNameLabel.text = content.name
        shopImageView.image = content.image
        ratingLabel.text = content.rating
        distanceLabel.text = content.distance
        locationLabel.text = "Location - \(content.location ?? "")"
    }

}
