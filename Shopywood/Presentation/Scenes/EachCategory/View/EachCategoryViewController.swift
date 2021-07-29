//
//  EachCategoryViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 20.07.21.
//

import UIKit
import Kingfisher

class EachCategoryViewController: BaseViewController, proceedToProductDetail{
    
    
    
    var categoryData = [Products]()
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private properties
    private var dataSource: EachCategoryDataSource!
    private var viewModel: EachCategoryViewModel!
    private var eachProductsManager: EachCategoryManagerProtocol!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print(categoryData)
        setupLayout()
        configureViewModel()
    }
    private func setupLayout() {
        collectionView.registerNib(class: EachCategoryItemCell.self)

    }
    
    private func configureViewModel() {
        dataSource = EachCategoryDataSource(with: collectionView, navigationController: self.navigationController)
        dataSource.configure(with: categoryData)
        dataSource.reloadData()
        dataSource.delegate = self
    }
    
    func proceedToProductDetailVC(image: URL?, Title: String, Price: Double, desc: String) {
        let vc = ProductDetailViewController.instantiateFromStoryboard() as ProductDetailViewController
        vc.text = Title
        vc.image = image
        vc.prices = Price
        vc.desc = desc
        self.navigationController?.pushViewController(vc, animated: true)

    }
}


