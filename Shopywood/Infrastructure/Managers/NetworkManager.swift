//
//  NetworkManager.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import Foundation

enum Endpoint: String {
    case jewelery = "'https://fakestoreapi.com/products/category/jewelery'"
    case electronics = "https://fakestoreapi.com/products/category/electronics"
    case womenClothing = "https://fakestoreapi.com/products/category/women's%20clothing"
    case menClothing = "https://fakestoreapi.com/products/category/men's%20clothing"
    
    var url: URL? {
        return URL(string: self.rawValue)
    }
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func get<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
