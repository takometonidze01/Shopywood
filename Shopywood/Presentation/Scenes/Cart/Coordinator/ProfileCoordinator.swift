//
//  ProfileCoordinator.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit

final class ProfileCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = ProfileViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_profile")
        
        self.navigationController?.viewControllers = [vc]
        
    }
    
    func start() {
        
    }
    
    func proceedToLocationViewController() {
        let vc = LocationViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func proceedToRateUsViewController() {
        let vc = RateUsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func proceedToQAViewController() {
        let vc = QuestionViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    
    func logOut() {
        let loginViewController = LogInViewController.instantiateFromStoryboard()
        UIApplication.shared.keyWindow?.rootViewController = loginViewController
    }
    
}
