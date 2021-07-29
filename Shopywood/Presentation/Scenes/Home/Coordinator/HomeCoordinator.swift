//
//  HomeCoordinator.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = HomeViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_home")
        
        self.navigationController?.viewControllers = [vc]
        
    }
    
    func start() {
        
    }
    
    func proceedToProductDetailVC(with title: String, image: URL?, price: Double, desc: String) {
        let vc = ProductDetailViewController.instantiateFromStoryboard()
        vc.text = title
        vc.image = image
        vc.prices = price
        vc.desc = desc
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

