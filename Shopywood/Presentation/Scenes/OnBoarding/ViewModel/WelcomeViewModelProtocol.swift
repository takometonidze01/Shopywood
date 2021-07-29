//
//  WelcomeViewModelProtocol.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import UIKit


protocol WelcomeViewModelProtocol: AnyObject {
    
    func fetchInfo(completion: @escaping (([WelcomeViewModel]) -> Void))
    
    init(with apiManager: OnBoardingManagerProtocol, navigationController: UINavigationController?, pageControl: UIPageControl)
}

final class WelcomesViewModel: WelcomeViewModelProtocol {
    
    // MARK: - Private properties
    private var apiManager: OnBoardingManagerProtocol
    private var navigationController: UINavigationController?
    private var pageControl : UIPageControl
    
    init(with apiManager: OnBoardingManagerProtocol, navigationController: UINavigationController?, pageControl: UIPageControl) {
        self.apiManager = apiManager
        self.navigationController = navigationController
        self.pageControl = pageControl
    }
    
    func fetchInfo(completion: @escaping (([WelcomeViewModel]) -> Void)) {
        apiManager.fetchInfo { result in
            switch result {
            case .success(let response):
                completion(response.map { WelcomeViewModel(infos: $0) })
                print(response)
            case .failure(let err):
                print(err)
            }

        }
    }
    
}
