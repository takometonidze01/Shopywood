//
//  QuestionViewModel.swift
//  Shopywood
//
//  Created by CodergirlTM on 26.07.21.
//

import Foundation

protocol TableViewSectionsViewModelProtocol: AnyObject {
    
    func editingChanged(with text: String, for indexPath: IndexPath?)
}

final class TableViewSectionsViewModel: TableViewSectionsViewModelProtocol {

    func editingChanged(with text: String, for indexPath: IndexPath?) {
        print("text: \(text) indexPath: \(indexPath)")
    }
}
