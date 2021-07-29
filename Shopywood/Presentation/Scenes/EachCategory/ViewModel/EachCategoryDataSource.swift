//
//  EachCategoryDataSource.swift
//  Shopywood
//
//  Created by CodergirlTM on 20.07.21.
//

import UIKit


class EachCategoryDataSource: NSObject,  proceedToProductDetail{
    // MARK: - Private properties
    
    private var collectionView: UICollectionView!{
        didSet{
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    private var productsViewModel = [ProductsViewModel]()
    private var productsManager: ProductsManagerProtocol!
    private var eachCategory: EachCategoryManagerProtocol!
    private var categoryViewModel =  [HomeViewModel]()
    private var categoryModel = CategoryModel()
    private var navigationController: UINavigationController?
    var categoryData = [Products]()
    var delegate: proceedToProductDetail!
    
    init(with collectionView: UICollectionView,navigationController: UINavigationController?) {
        super.init()
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.registerNib(class: EachCategoryItemCell.self)
        self.navigationController = navigationController
        
    }
    
    func configure(with categoryData: [Products]) {
        self.categoryData = categoryData
        collectionView.reloadData()
    }
    func proceedToProductDetailVC(image: URL?, Title: String, Price: Double, desc: String) {
        let vc = ProductDetailViewController.instantiateFromStoryboard() as ProductDetailViewController
        vc.text = Title
        vc.image = image
        vc.prices = Price
        vc.desc = desc

    }
    
}

extension EachCategoryDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EachCategoryItemCell", for: indexPath as IndexPath) as! EachCategoryItemCell
        let objData = categoryData[indexPath.row]
        print(objData)
        if objData != nil {
            if objData.image != nil {
                let url = URL(string: objData.image!)
                cell.productImg.kf.setImage(with: url)
                cell.productImg.contentMode = .scaleAspectFit
                
            }
            if objData.title != nil {
                cell.productTitle.text = objData.title
                
            }
            
            if objData.price != nil {
                let c: String = String(format: "%.2f", objData.price!)

                cell.productPrice.text = c
                
            }
            
        }
        cell.btnFullAction = { () in
            let url = URL(string: objData.image!)
            self.delegate.proceedToProductDetailVC(image: url!, Title: objData.title!, Price: objData.price!, desc: objData.description!)
        }
        cell.backgroundColor = UIColor.black
        return cell
    }
}

extension EachCategoryDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension EachCategoryDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width/2 , height:400)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
   

}
