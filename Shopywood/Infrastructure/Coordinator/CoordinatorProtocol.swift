//
//  CoordinatorProtocol.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//


import UIKit

protocol CoordinatorProtocol: AnyObject {
        
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func secondStart()
    func proceedToLogInPage()
    func proceedToSignUpPage()
    func proceedToMainTabBarController()
    func proceedToEachCategoryCollectionView()
    func proceedToCheckoutViewController(with data: String)
    func proceedToConfirmationViewController()
    
    func proceedBack()
    func proceedToShippingAddress()
    func proceedToQA()
    func proceedToLocationViewController()
    func proceedToRateUsViewController()
    func proceedToQAViewController()
    func logOut()
    func proceedToProductDetailVC()
}

extension CoordinatorProtocol {
    func proceedToLogInPage() { }
    func secondStart() {}
    func proceedToSignUpPage() { }
    func proceedToMainTabBarController() { }
    func proceedToEachCategoryCollectionView() { }
    func proceedToCheckoutViewController(with data: String) { }
    func proceedToConfirmationViewController(){ }
    func proceedBack() {}
    func proceedToShippingAddress() {}
    func proceedToQA() {}
    func proceedToLocationViewController() {}
    func proceedToRateUsViewController() {}
    func proceedToQAViewController() {}
    func logOut() {}
    func proceedToProductDetailVC() {}
}
