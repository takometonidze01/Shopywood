//
//  Category.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import Foundation

struct Category: Codable {
    let text: String?
    let image: String?
}

protocol ICategoryModel {
	var title: String? { get }
	var image: URL? { get }
	var type: ItemCategory? { get }
}

struct CategoryModel: ICategoryModel {
	var title: String?
	var image: URL?
	var type: ItemCategory?
}

extension CategoryModel {
	init(item: Category) {
		self = CategoryModel(title: item.text, image: URL(string: item.image ?? ""), type: getType(item.text))
	}

	private func getType(_ title: String?) -> ItemCategory? {
		switch title {
		case "Electronics": return .electronics
		case "Jewelery": return .jewelery
		case "Men's clothing": return .men
		case "Women's clothing": return .women
		default: return nil
		}
	}
}
