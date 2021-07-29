//
//  CategoryManager.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import Foundation

protocol CategoryManagerProtocol: AnyObject {
    func fetchCategory(completion: @escaping ((Result<[Category], Error>) -> Void))
}

class CategoryManager: CategoryManagerProtocol {
    func fetchCategory(completion: @escaping ((Result<[Category], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/8d8751ce-bed5-4b10-9566-ee269c869f6c"
        NetworkManager.shared.get(url: url) { (result: Result<[Category], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
