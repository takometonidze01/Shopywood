//
//  ProductsCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit
import Kingfisher

protocol proceedToProductDetail : AnyObject {
    func proceedToProductDetailVC(image: URL?, Title: String, Price: Double, desc: String)
}

class ProductsCell: UITableViewCell {
    
    weak var delegate: proceedToProductDetail!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myCollectionViewHeight: NSLayoutConstraint!
    

    var title = ""
    var price = ""
    
    // MARK: - Private properties
    private var productsViewModel = [ProductsViewModel]()
    private var productsManager: ProductsManagerProtocol!
    
    var product = [ProductsViewModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    override func awakeFromNib() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(class: ItemCell.self)
        collectionView.isScrollEnabled = false
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with product: [ProductsViewModel]) {
        self.product = product
    }

    
}

extension ProductsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(ItemCell.self, for: indexPath)
        cell.itemImage.kf.setImage(with: product[indexPath.row].image)
        cell.itemPriceLabel.text = "\(product[indexPath.row].price  ?? 2.0)$"
        cell.itemTitleLabel.text = product[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = ProductDetailViewController.instantiateFromStoryboard() as! ProductDetailViewController
        let obj = product[indexPath.row]
        let url = URL?(obj.image!)
        delegate.proceedToProductDetailVC(image: url!, Title: obj.title, Price: obj.price!, desc: obj.description)

        
        
    }

}

extension ProductsCell: UICollectionViewDelegate {

}

extension ProductsCell: UICollectionViewDelegateFlowLayout {
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
