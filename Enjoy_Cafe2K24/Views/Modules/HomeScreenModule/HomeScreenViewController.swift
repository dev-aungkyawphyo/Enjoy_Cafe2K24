//
//  HomeScreenViewController.swift
//  Enjoy_Cafe2K24
//
//  Created by Aung Kyaw Phyo on 09/10/2024.
//

import UIKit

class HomeScreenViewController: EnjoyViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    var viewModel: HomeViewModel?
    var product: [Product] = [Product]()
    var content: [Content] = [Content]()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        configTitle()
        searchBar.searchBarStyle()
        collectionViewSetup()
        binding()
    }
    
    private func collectionViewSetup() {
        productCollectionView.collectionViewLayout = .productLayout
        productCollectionView.registerCell(type: ProductCollectionViewCell.self)
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        shopCollectionView.collectionViewLayout = .productLayout
        shopCollectionView.registerCell(type: ShopCollectionViewCell.self)
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
    }
    
    // MARK: Custom initializers go here
    private func configTitle() {
        introLabel.text = "Find the best coffee for you"
        let str = "Coffee"
        let range = (introLabel.text! as NSString).range(of: str)
        let attributedText = NSMutableAttributedString.init(string: introLabel.text!)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "PrimaryColor")!,
                                    range: range)
        introLabel.attributedText = attributedText
    }
    
    private func binding() {
        viewModel = HomeViewModel()
        
    }
    
    // MARK: User Interaction - Actions & Targets
    @IBAction func userImageButtonAction(_ sender: UIButton) {
        let profileVC = ProfileScreenViewController.instantiate(storyboard: .baseRouter)
        profileVC.modalTransitionStyle = .crossDissolve
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true)
    }
    
    @IBAction func viewAllButtonAction(_ sender: UIButton) {
        
    }
    
}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UICollectionViewDelegate
extension HomeScreenViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension HomeScreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case productCollectionView:
            return product.count
        case shopCollectionView:
            return content.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case productCollectionView:
            let cell = collectionView.dequeueCell(withType: ProductCollectionViewCell.self, for: indexPath) as! ProductCollectionViewCell
            cell.configCell(product: product[indexPath.row])
            return cell
        case shopCollectionView:
            let cell = collectionView.dequeueCell(withType: ShopCollectionViewCell.self, for: indexPath) as! ShopCollectionViewCell
            cell.configCell(content: content[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}
