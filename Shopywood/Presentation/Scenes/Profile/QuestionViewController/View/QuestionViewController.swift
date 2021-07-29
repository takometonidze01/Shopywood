//
//  QuestionViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 26.07.21.
//

import UIKit

class QuestionViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    private var viewModel: TableViewSectionsViewModelProtocol!

    private var modelsList = [
        "What payment methods do you accept?",
        "How can I track my shipment?",
        "How much will shipping cost?",
        "Do you sell quality products?",
        ""
    ]
    
    private var bmwList = [
        "We accept Visa and MasterCard on our website. Our sales staff can also process other payment types manually, including checks and internet banking. To pay using one of these methods, please contact us to place your order."
    ]
    
    private var teslaList = [
        "Our staff will be happy to provide you with a tracking number to track your parcel. Please contact us for your tracking number, and then track it on the UPS website."
    ]
    
    private var mersedesList = [
        "Shipping costs are calculated at the checkout, based on the dimensions and weight of your shipment, and the shipping address. To find out how much shipping will cost, please add the desired products to your cart and complete the checkout process."
    ]
    private var question4 = [
        "Define Instruments products are designed and manufactured in New Zealand according to rigorous quality standards. We are an established company and our products have been field tested for more than 15 years.Our manufacturing plant takes quality very seriously and is ISO 9001 approved by Lloyds Register. For more information, please read our Quality Policy."
    ]
    
    
    private var mainList = [[String]]()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TableViewSectionsViewModel()
        
        mainList.append(bmwList)
        mainList.append(teslaList)
        mainList.append(mersedesList)
        mainList.append(question4)
        
        
        mainList.append(["", "", "", "",""])

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            UINib(nibName: "QuestionCell", bundle: nil),
            forCellReuseIdentifier: "QuestionCell"
        )
        
//        tableView.indexPathsForSelectedRows
    }
}

extension QuestionViewController: UITableViewDelegate {
    
}

// MARK: - UITableView Data Source

extension QuestionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        
        cell.configure(with: mainList[indexPath.section][indexPath.row])
        cell.indexPath = indexPath
        cell.editingDidChanged = viewModel.editingChanged(with:for:)
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return modelsList[section]
    }
}

