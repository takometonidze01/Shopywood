//
//  MainTabController.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit

class MainTabController: UITabBarController, Storyboarded, CoordinatorDelegate {
    func start() {
        
    }
    
    // MARK: - Private properties

    private var homeCoordinator = HomeCoordinator()
    private var cartCoordinator = CartCoordinator()
    private var profileCoordinator = ProfileCoordinator()
    
    var coordinator: CoordinatorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().tintColor = UIColor.white

        viewControllers = [
            homeCoordinator.navigationController!,
            cartCoordinator.navigationController!,
            profileCoordinator.navigationController!
        ]
    }
}
