//
//  OnBoardingManager.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import Foundation

protocol OnBoardingManagerProtocol: AnyObject {
    func fetchInfo(completion: @escaping ((Result<[OnBoarding], Error>) -> Void))
}

class OnBoardingManager: OnBoardingManagerProtocol {
    func fetchInfo(completion: @escaping ((Result<[OnBoarding], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/ed8a8205-8781-4558-8a54-961dfc5f09dd"
        NetworkManager.shared.get(url: url) { (result: Result<[OnBoarding], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
