//
//  RateUsViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 25.07.21.
//

import UIKit

class RateUsViewController: BaseViewController {

    @IBOutlet weak var countDownButton: UIButton!
    
    @IBOutlet weak var rateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTask { (success) -> Void in
            if success {
                rateLabel.text = "Your Opinion is Important For Us"
            }
        }
    }

    @IBAction func testViewAppears(_ sender: Any) {
        rateApp(self, immediatly: nil)

    }
    @IBAction func testShowAlert(_ sender: Any) {
        showRateAlertInmediatly(self)
    }
    func firstTask(completion: (_ success: Bool) -> Void) {
        showRateAlertInmediatly(self)
        completion(true)
    }
    
}
