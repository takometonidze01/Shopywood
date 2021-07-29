//
//  HomeViewModel.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import Foundation

struct HomeViewModel {
	var categoryModel: CategoryModel
    
    init(infos: Category) {
        self.categoryModel = CategoryModel(item: infos)
    }
}
