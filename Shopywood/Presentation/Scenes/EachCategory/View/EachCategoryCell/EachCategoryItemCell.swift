//
//  EachCategoryItemCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 20.07.21.
//

import UIKit

class EachCategoryItemCell: UICollectionViewCell {

    @IBOutlet weak var btnViewAll: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var btnFullAction: (()->())?

    // MARK: - Private properties
    private var categoryViewModel =  [HomeViewModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImg.layer.cornerRadius = 10
        productImg.layer.masksToBounds = true
        productImg.isUserInteractionEnabled = true
        
    }

    @IBAction func ActionViewAll(_ sender: Any) {
        self.btnFullAction?()

    }
}
