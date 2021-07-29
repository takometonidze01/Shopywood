//
//  QuestionCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 26.07.21.
//

import UIKit

class QuestionCell: UITableViewCell {
    
    var editingDidChanged: ((String, IndexPath?) -> Void)?
    
    var indexPath: IndexPath?
    
    @IBOutlet weak var questionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with title: String) {
        questionLabel.text = title
    }
}
