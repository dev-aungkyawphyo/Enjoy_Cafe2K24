//
//  HomeModel.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 13/10/2024.
//

import Foundation
import UIKit

struct ProductsRequestModel {
    let product: [Product]
    let content: [Content]
}

struct Product {
    var id: String?
    var name: String?
    var image: UIImage?
    var rating: String?
    var detail: String?
    var description: String?
    var price: Double?
    var createdDate: String?
    var time: String?
    var location: String?
}

struct Content {
    var id: String?
    var name: String?
    var image: UIImage?
    var rating: String?
    var time: String?
    var distance: String?
    var location: String?
}
