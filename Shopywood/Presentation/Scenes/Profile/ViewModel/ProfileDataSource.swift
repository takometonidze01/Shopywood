//
//  ProfileDataSource.swift
//  Shopywood
//
//  Created by CodergirlTM on 25.07.21.
//

import UIKit
import Kingfisher

class ProfileDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    var coordinator: CoordinatorProtocol?
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var navigationController: UINavigationController?
    
    private var items = [
        "Profile",
        "Shipping Address",
        "Privaci Policy",
        "Rate Us",
        "About us",
        "Change Language",
        "Questions & Answers",
        "Log out"
    ]

    
    init(with collectionView: UICollectionView,coordinator: CoordinatorProtocol, navigationController: UINavigationController?) {
        super.init()
        self.collectionView = collectionView
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.coordinator = coordinator
        self.navigationController = navigationController

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(ProfileItemCell.self, for: indexPath)
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeaderCell", for: indexPath)
            return header
        }
        
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            coordinator?.proceedToLocationViewController()
        }
        else if indexPath.row == 3 {
            coordinator?.proceedToRateUsViewController()
        }
        else if indexPath.row == 6 {
            coordinator?.proceedToQAViewController()
        }
        else if indexPath.row == 7 {
            UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
            coordinator?.logOut()
        }
    }
    
    
    
}

extension ProfileDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
