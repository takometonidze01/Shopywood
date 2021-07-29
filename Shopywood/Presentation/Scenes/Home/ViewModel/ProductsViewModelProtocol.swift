//
//  ProductsViewModelProtocol.swift
//  Shopywood
//
//  Created by CodergirlTM on 21.07.21.
//

import UIKit

protocol ProductsModelProtocol: AnyObject {
    func fetchProducts(completion: @escaping (([ProductsViewModel]) -> Void))
    
//    var controller: CoordinatorDelegate { get }
    
    init(with apiManager: ProductsManagerProtocol, navigationController: UINavigationController?)
    
//    init(with controller: CoordinatorDelegate, categoryManager: CategoryManagerProtocol)
}

final class ProductViewModel: ProductsModelProtocol {
    
    // MARK: - Private properties
    
    private var navigationController: UINavigationController?
    
    private var apiManager: ProductsManagerProtocol
    
    init(with apiManager: ProductsManagerProtocol, navigationController: UINavigationController?) {
        self.apiManager = apiManager
        self.navigationController = navigationController
    }
    
    

    
//    private(set) var controller: CoordinatorDelegate
    
//    init(with apiManager: CategoryManagerProtocol, controller: CoordinatorDelegate) {
//        self.apiManager = apiManager
//        self.controller = controller
//    }

    
    func fetchProducts(completion: @escaping (([ProductsViewModel]) -> Void)) {
        apiManager.fetchProducts { result in
            switch result {
            case .success(let response):
                completion(response.map { ProductsViewModel(infos: $0) })
                print(response)
            case .failure(let err):
                print(err)
            }

        }
    }
}
