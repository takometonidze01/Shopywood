//
//  LogInCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import UIKit

protocol clickedDelegate : AnyObject{
    func signIn()
    func signUp()
}

class LogInCell: UICollectionViewCell{

   weak var delegate: clickedDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
 
    @IBAction func logIn(_ sender: Any) {
        delegate?.signIn()
    }

    @IBAction func SignUp(_ sender: Any) {
        delegate?.signUp()
    }
}
