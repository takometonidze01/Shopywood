//
//  UICollectionView+Extension.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//


import UIKit

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nib(), forCellWithReuseIdentifier: T.identifier)
    }

    func registerClass<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }

    func deque<T: UICollectionViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T // swiftlint:disable:this force_cast
    }

    private enum PillCellSpacing: CGFloat {

        case defaultValue = 10.0
    }
}
