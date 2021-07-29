//
//  ConfirmationViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 22.07.21.
//

import UIKit

class ConfirmationViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func keepShopping(_ sender: Any) {
        coordinator?.proceedBack()
    }
    

}
