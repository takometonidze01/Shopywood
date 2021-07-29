//
//  ItemCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 20.07.21.
//

import UIKit

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImage.layer.cornerRadius = 10
        itemImage.layer.masksToBounds = true
        itemImage.isUserInteractionEnabled = true
    }

}
