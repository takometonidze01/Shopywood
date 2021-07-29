//
//  CartViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit
import CoreData
class CartViewController: BaseViewController {
    
    @IBOutlet weak var lblTotla: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    private var dataSource: CartDataSource!
    
    var PriceArray = [Int]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()

    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(false)
            if cartList.isEmpty == true{
                lblTotla.text = "Total:"
            }else{
                calculateTotal()
            }
        }

    
    @IBAction func checkoutButton(_ sender: Any) {
        coordinator?.proceedToCheckoutViewController(with: lblTotla.text ?? "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: CartCell.self)
    }
    
    private func configureViewModel() {
        dataSource = CartDataSource(with: tableView, coordinator: coordinator!, navigationController: self.navigationController)
        dataSource.firstLoad = true
        if cartList.isEmpty == false{
            cartList.remove(at: 0)
        }
        
        dataSource.dataSave()
        
    }
    func calculateTotal(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            for result in results {
                let cartItem = result as! Cart
                // Calculate the grand total...
                let total = (cartItem.price)
                let orderNumberInt = total?.intValue
                PriceArray.append(orderNumberInt!)
                let sum = PriceArray.reduce(0, +)
                print("Sum of Array is : ", sum)
                lblTotla.text = "Total: \( String(sum))\("$")"
                
            }
        } catch {
            print("Fetch Failed")
        }
        
    }
}
