//
//  AppCoordinator.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = WelcomeViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
        
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    func secondStart() {
        let vc = MainTabController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
        
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func proceedToLogInPage() {
        let vc = LogInViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func proceedToSignUpPage() {
        let vc = SignUpViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func proceedToMainTabBarController() {
        let vc = MainTabController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func proceedToEachCategoryCollectionView() {
        let vc = EachCategoryViewController.instantiateFromStoryboard()
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func proceedToCheckoutViewController(with: String){
        let vc = CheckoutViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    
}
