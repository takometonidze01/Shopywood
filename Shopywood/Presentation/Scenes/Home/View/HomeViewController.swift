//
//  HomeViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit
import CoreLocation

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var locationManager: CLLocationManager?
    
    // MARK: - Private properties
    
    private var dataSource: HomeDataSource!
    private var viewModel: HomeViewModelProtocol!
    private var viewModels: ProductsModelProtocol!
    private var productsManager: ProductsManagerProtocol!
    private var categoryManager: CategoryManagerProtocol!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
        self.navigationController?.navigationBar.isHidden = true
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.delegate = self
        
    }
    

    private func setupLayout() {
        tableView.registerNib(class: BannerCell.self)
        tableView.registerNib(class: CategoryCell.self)
        tableView.registerNib(class: ProductsCell.self)
        tableView.backgroundColor = .clear

    }
    
    private func configureViewModel() {
        categoryManager = CategoryManager()
        viewModel = HomesViewModel(with: categoryManager, navigationController: self.navigationController )
        productsManager = ProductsManager()
        viewModels = ProductViewModel(with: productsManager, navigationController: self.navigationController)
        dataSource = HomeDataSource(with: tableView, viewModel: viewModel, viewModels: viewModels, coordinator: coordinator!, navigationController: self.navigationController)
        
        dataSource.refresh()
        dataSource.reload()
    }

}


extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager?.startUpdatingLocation()
        case .denied, .restricted:
            openSettingsAlert()
        case .notDetermined:
            print("მომხმარებელს ჯერ არ ამოურჩევია")
        default:
            break
        }
    }
    private func openSettingsAlert() {
        let alert = UIAlertController(
            title: "Warning",
            message: "Allow App to access this device's location",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Setting", style: .default, handler: { _ in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }

            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }))
        
        self.present(alert, animated: true)
    }
}
