//
//  OnBoardingCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import UIKit
import Kingfisher

class OnBoardingCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: WelcomeViewModel) {
        img.kf.setImage(with: item.image)
        titleLabel.text = item.text
        secondTextLabel.text = item.secondText
    }

}
