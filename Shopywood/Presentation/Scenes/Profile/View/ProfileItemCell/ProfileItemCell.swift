//
//  ProfileItemCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 25.07.21.
//

import UIKit

class ProfileItemCell: UICollectionViewCell {

    @IBOutlet weak var itemCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with title: String) {
        itemCellLabel.text = title
    }
}
