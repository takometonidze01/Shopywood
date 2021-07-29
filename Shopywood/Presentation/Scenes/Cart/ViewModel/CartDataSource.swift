//
//  CartDataSource.swift
//  Shopywood
//
//  Created by CodergirlTM on 22.07.21.
//

import UIKit
import CoreData

class CartDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var coordinator: CoordinatorProtocol?
    var firstLoad = false
    
    // MARK: - Private properties
    private var tableView: UITableView!
    private var navigationController: UINavigationController?
    
    
    init(with tableView: UITableView,coordinator: CoordinatorProtocol, navigationController: UINavigationController?) {
        super.init()
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.coordinator = coordinator
        self.navigationController = navigationController
    }
    
    func dataSave() {
        if (firstLoad) {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let cartItem = result as! Cart
                    cartList.append(cartItem)
                    tableView.reloadData()
                }
            } catch {
                print("Fetch Failed")
            }
        }else{
            print("firstLoad is false now")
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: CartCell.self, for: indexPath)
        let thisItem = cartList[indexPath.row]
        cell.productTitle.text = thisItem.name
        cell.productPrice.text = "Price:\(thisItem.price!)$"
        cell.productCount.text = "Quantity:\(thisItem.quantity!)"
        cell.productImage.kf.setImage(with: thisItem.imageUrl)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
    if editingStyle == .delete {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }

        //remove object from core data
        let appDelegates = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        context.delete(cartList[indexPath.row] as NSManagedObject)

        tableView.beginUpdates()
        cartList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()

        appDelegate.saveContext()
        }
    }
    
    
}
