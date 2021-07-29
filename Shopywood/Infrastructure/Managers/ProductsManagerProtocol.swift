//
//  ProductsManagerProtocol.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import Foundation

protocol ProductsManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ((Result<[Products], Error>) -> Void))
}

class ProductsManager: ProductsManagerProtocol {
    func fetchProducts(completion: @escaping ((Result<[Products], Error>) -> Void)) {
        let url = "https://fakestoreapi.com/products"
        NetworkManager.shared.get(url: url) { (result: Result<[Products], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
