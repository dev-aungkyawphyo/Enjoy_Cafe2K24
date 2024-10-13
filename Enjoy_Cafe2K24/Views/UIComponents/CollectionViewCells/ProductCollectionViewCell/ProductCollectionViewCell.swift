//
//  ProductCollectionViewCell.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 13/10/2024.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        favButton.layer.cornerRadius = favButton.frame.width / 2
    }
    
    func configCell(product: Product) {
        productCodeLabel.text = "Product ID: \(product.id ?? "")"
        productNameLabel.text = product.name
        productPriceLabel.text = "\(product.price ?? 0.0) MMK"
        productImageView.image = product.image
        productRatingLabel.text = product.rating
        locationLabel.text = product.location
        deliveryTimeLabel.text = product.time
    }

}
