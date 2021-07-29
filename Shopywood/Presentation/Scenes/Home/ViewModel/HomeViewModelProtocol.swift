//
//  HomeViewModel.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func fetchCategory(completion: @escaping (([HomeViewModel]) -> Void))
    
    
    init(with apiManager: CategoryManagerProtocol,navigationController: UINavigationController?)
    
}

final class HomesViewModel: HomeViewModelProtocol {
    
    // MARK: - Private properties
    private var apiManager: CategoryManagerProtocol
    private var navigationController: UINavigationController?
    
    
    init(with apiManager: CategoryManagerProtocol, navigationController: UINavigationController?) {
        self.apiManager = apiManager
        self.navigationController = navigationController
    }
    
    func fetchCategory(completion: @escaping (([HomeViewModel]) -> Void)) {
        apiManager.fetchCategory { result in
            switch result {
            case .success(let response):
                completion(response.map { HomeViewModel(infos: $0) })
                print(response)
            case .failure(let err):
                print(err)
            }

        }
    }
}
