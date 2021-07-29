//
//  HomeDataSource.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit
import Kingfisher

class HomeDataSource: NSObject, UITableViewDataSource, clickedCell, UITableViewDelegate, proceedToProductDetail {
    
    

    // MARK: - Private properties
    
    var coordinator: CoordinatorProtocol?

    private var tableView: UITableView!
    private var categoryViewModel = [HomeViewModel]()
    private var productsViewModel = [ProductsViewModel]()
    private var viewModels: ProductsModelProtocol!
    private var viewModel: HomeViewModelProtocol!
    private var productsManager: ProductsManagerProtocol!
    private var categoryManager: CategoryManagerProtocol!
    private var navigationController: UINavigationController?
    private var eachCategory: EachCategoryManagerProtocol!


    
    
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol!, viewModels: ProductsModelProtocol!,coordinator: CoordinatorProtocol, navigationController: UINavigationController?) {
        super.init()
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.viewModel = viewModel
        self.viewModels = viewModels
        self.coordinator = coordinator
        self.navigationController = navigationController
        self.eachCategory = EachCategoryManager()
        
    }
//    func fetchData() {
//        eachCategory.fetchEachCategory(with: .men) { mens in
//            disp
//        }
//    }
    
    func goEachCategoryCollectionView(catsData: [Products]) {
        print("coordinator")
        coordinator?.proceedToEachCategoryCollectionView()
        let vc = EachCategoryViewController.instantiateFromStoryboard()
        vc.categoryData = catsData
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    func goEachCategoryCollectionView() {

//    }

    func proceedToProductDetailVC(image: URL?, Title: String, Price: Double, desc: String) {
        let vc = ProductDetailViewController.instantiateFromStoryboard() as ProductDetailViewController
//        let url = URL(string: obj.image)
        vc.text = Title
        vc.image = image
        vc.prices = Price
        vc.desc = desc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

    func refresh() {
        viewModel.fetchCategory { [weak self] viewModels in
            self?.categoryViewModel.append(contentsOf: viewModels)
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func reload() {
        viewModels.fetchProducts { [weak self] viewM in
            self?.productsViewModel.append(contentsOf: viewM)
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.deque(class: BannerCell.self, for: indexPath)
            return cell
        }
        

        if indexPath.row == 1 {
            let cell = tableView.deque(class: CategoryCell.self, for: indexPath)
            cell.configure(with: categoryViewModel)
            cell.delegate = self
//            cell.category = categoryViewModel
            return cell
            
        }
//        for i in 2 ... 20 {
//            if indexPath.row == i {
//                let cell = tableView.deque(class: ProductsCell.self, for: indexPath)
//                cell.configure(with: productsViewModel)
//                cell.delegate = self
//                return cell
//
//            }
//        }
        
        if indexPath.row == 2 {
            let cell = tableView.deque(class: ProductsCell.self, for: indexPath)
            cell.configure(with: productsViewModel)
            cell.delegate = self
            return cell
        }
        
//        if indexPath.row == 5 {
//            let cell = tableView.deque(SavedCell.self, for: indexPath)
//            cell.viewAll.addTarget(self, action: #selector(goToSavedItems), for: .touchUpInside)
//            return cell
//        }
//        if indexPath.row == 6 {
//            let cell = tableView.deque(Brands.self, for: indexPath)
//            return cell
//        }
        

        
        let cell = UITableViewCell()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        } else if indexPath.row == 1 {
            return 200
        } else if indexPath.row == 2 {
            return 4000
        }
        return 1000
    }

}



