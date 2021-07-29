//
//  EachCategoryManager.swift
//  Shopywood
//
//  Created by CodergirlTM on 20.07.21.
//

import Foundation
enum ItemCategory: String {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case women = "women's%20clothing" 
    case men = "men's%20clothing"
}

protocol EachCategoryManagerProtocol: AnyObject {
    func fetchEachCategory(with category: ItemCategory, completion: @escaping ((Result<[Products], Error>) -> Void))
}

class EachCategoryManager: EachCategoryManagerProtocol {
    func fetchEachCategory(with category: ItemCategory, completion: @escaping ((Result<[Products], Error>) -> Void)) {
        let url = "https://fakestoreapi.com/products/category/\(category.rawValue)"
        NetworkManager.shared.get(url: url) { (result: Result<[Products], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
//                completion(.failure(err))
                print("Error here\(err)")
            }
        }
    }
}
