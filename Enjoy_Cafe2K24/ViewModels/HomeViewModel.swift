//
//  HomeViewModel.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 13/10/2024.
//

import Foundation
import UIKit

protocol AllProductScreenInterectorProtocol: AnyObject {
    func getProductsAPICall(_ product: ProductsRequestModel)
}

final class HomeViewModel: AllProductScreenInterectorProtocol {
    
    // MARK: - Call Service
    func getProductsAPICall(_ product: ProductsRequestModel) {
        let product = ProductsRequestModel(product: [
            .init()
        ], content: [
            
        ])
    }
    
}
