//
//  EachCategoryViewModelProtocol.swift
//  Shopywood
//
//  Created by CodergirlTM on 21.07.21.
//


import UIKit

protocol EachCategoryViewModelProtocol: AnyObject {
    func fetchEachCategory(completion: @escaping (([EachCategoryViewModel]) -> Void))

    init(with apiManager: EachCategoryManagerProtocol,navigationController: UINavigationController?)
}


final class EachCategoriesViewModel: EachCategoryViewModelProtocol {
    
    // MARK: - Private properties
    private var apiManager: EachCategoryManagerProtocol
    private var navigationController: UINavigationController?

    init(with apiManager: EachCategoryManagerProtocol,navigationController: UINavigationController?) {
        self.apiManager = apiManager
        self.navigationController = navigationController
    }

    func fetchEachCategory(completion: @escaping (([EachCategoryViewModel]) -> Void)) {
        apiManager.fetchEachCategory(with: .electronics) { result in
            switch result {
            case .success(let response):
                completion(response.map { EachCategoryViewModel(infos: $0) })
                print(response)
            case .failure(let err):
                print(err)
            }

        }
    }

}
