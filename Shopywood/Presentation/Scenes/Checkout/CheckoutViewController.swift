//
//  CheckoutViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 23.07.21.
//

import UIKit
import CoreData

var cartList = [Cart]()
class CheckoutViewController: BaseViewController {

    @IBOutlet weak var cardCvv: UITextField!
    @IBOutlet weak var cardExpiryYear: UITextField!
    @IBOutlet weak var creditCardView: CreditCardView!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var cardExpiryMonth: UITextField!
    
    var alertController: UIAlertController?
    var total: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPrice.text = total
        // Do any additional setup after loading the view.
    }
    
    @IBAction func payNowButton(_ sender: Any) {
        
        var error = ""
        
        if (self.cardExpiryMonth.text?.isEmpty)! {
            error = "Please enter the expiry month of your card."
        }
        else if (self.cardExpiryYear.text?.isEmpty)! {
            error = "Please enter the expiry year of your card."
        }
        else if (self.cardCvv.text?.isEmpty)!{
            error = "Please enter the CVV number of your card."
        }
        
        
        
        if error.isEmpty {
            
            showAlertMsg("Confirm Purchase", message: "Pay " + totalPrice.text!, style: UIAlertController.Style.actionSheet)
            
        }
        else {
            showAlertMsg("Error", message: error, style: UIAlertController.Style.alert)
        }
    }
    
    func showAlertMsg(_ title: String, message: String, style: UIAlertController.Style) {
        
        self.alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if style == UIAlertController.Style.actionSheet {
            alertController?.addAction(UIAlertAction(title: "Pay", style: .default, handler: { [self] _ in
                self.clearAllCoreData()
                clearDeepObjectEntity("Cart")
                cartList.removeAll()
                coordinator?.proceedToConfirmationViewController()
                
            }))
            
            alertController?.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        } else {
            alertController?.addAction(UIAlertAction(title: "Okay", style: .default))
        }
        
        self.present(self.alertController!, animated: true, completion: nil)
        
    }
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    public func clearAllCoreData() {
        let entities = appDelegate.persistentContainer.managedObjectModel.entities
        entities.flatMap({ $0.name }).forEach(clearDeepObjectEntity)
    }

    private func clearDeepObjectEntity(_ entity: String) {
        let context = appDelegate.persistentContainer.viewContext

        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }

}
