//
//  ProductDetailViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 20.07.21.
//

import UIKit
import Kingfisher
import CoreData

class ProductDetailViewController: BaseViewController {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var image: URL?
    var text: String = ""
    var desc: String = ""
    var prices : Double = 0.0
    var quantity: Int = 1
    var totalPrice: Double = 0.0
    var subTotalPrice: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImage.kf.setImage(with: image)
        productTitleLabel.text = text
        productPriceLabel.text = "\(prices)$"
        productDescriptionLabel.text = desc
        totalPriceLabel.text = "Total Price:\(prices)$"
        quantityLabel.text = "Quantity:\(quantity)"
        totalPrice = prices
        subTotalPrice = prices
    }
    
    @IBAction func quantityStepper(_ sender: UIStepper) {
        quantity = Int(sender.value)
        updateTotalPrice()
    }
    
    func updateTotalPrice() {
        if self.prices != nil {
            totalPrice = subTotalPrice * Double(quantity)
            DispatchQueue.main.async { [self] in
                totalPriceLabel.text = "Total Price:\(self.totalPrice)$"
                quantityLabel.text = "Quantity:\(self.quantity)"
            }
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Cart", in: context)
        let cartItem = Cart(entity: entity!, insertInto: context)
        
        cartItem.name = text
        cartItem.price = NSNumber(value: prices)
        cartItem.quantity = NSNumber(value: quantity)
        cartItem.imageUrl = image
        
        do {
            try context.save()
            cartList.append(cartItem)
            let alert = UIAlertController(title: "Alert", message: "Added to Cart!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        } catch {
            print(error)
        }
    }
    
}
