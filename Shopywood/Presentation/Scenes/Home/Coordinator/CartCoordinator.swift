//
//  CartCoordinator.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit

final class CartCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = CartViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_cart")
        
        self.navigationController?.viewControllers = [vc]
        
    }
    
    func start() {
        
    }
    func proceedToCheckoutViewController(with data: String){
        let vc = CheckoutViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
        vc.total = data
        navigationController?.isNavigationBarHidden = true
    }
    
    func proceedToConfirmationViewController() {
        let vc = ConfirmationViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    
    func proceedBack() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
