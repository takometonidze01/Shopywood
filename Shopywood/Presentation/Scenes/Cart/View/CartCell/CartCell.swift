//
//  CartCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 22.07.21.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.layer.cornerRadius = 10
        productImage.layer.masksToBounds = true
        productImage.isUserInteractionEnabled = true    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
