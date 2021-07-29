//
//  CategoryItemCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit
import Kingfisher

class CategoryItemCell: UICollectionViewCell {

    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImg.layer.borderWidth = 2
        categoryImg.layer.borderColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        categoryImg.layer.cornerRadius = categoryImg.frame.height / 2
    }
    
    func configure(with item: OnBoarding) {
        categoryItemLabel.text = item.text
    }

}
