//
//  EachCategoryViewModel.swift
//  Shopywood
//
//  Created by CodergirlTM on 21.07.21.
//

import Foundation

struct EachCategoryViewModel : Codable {
    
    // MARK: - Private properties
    private var infos: Products
    
    init(infos: Products) {
        self.infos = infos
    }
    
    var image : URL? {
        URL(string: infos.image ?? "")
    }
    
    var title : String {
        infos.title ?? ""
    }
    
    var price : Double? {
        infos.price
    }
    
    var description : String {
        infos.description ?? ""
    }
}
