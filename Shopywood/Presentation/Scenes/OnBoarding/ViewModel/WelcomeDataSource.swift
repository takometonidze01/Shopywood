//
//  WelcomeDataSource.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import UIKit

class WelcomeDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, clickedDelegate {
    var coordinator: CoordinatorProtocol?
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var viewModel: WelcomeViewModelProtocol!
    private var infoViewModel = [WelcomeViewModel]()
    private var pageControl: UIPageControl!
    private var navigationController: UINavigationController?
    static var itemsCount: Int!
    
    private var currentPage = 0

    var window: UIWindow?

    init(with collectionView: UICollectionView, viewModel: WelcomeViewModelProtocol, pageControl: UIPageControl, coordinator: CoordinatorProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.coordinator = coordinator
        
        self.viewModel = viewModel
        self.pageControl = pageControl
        

    }
    
    func refresh() {
        viewModel.fetchInfo{ viewModels in
            self.infoViewModel.append(contentsOf: viewModels)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                WelcomeDataSource.itemsCount = self.infoViewModel.count
            }
        }
        
    }

    func signIn() {
        coordinator?.proceedToLogInPage()

                
    }
    
    func signUp() {
        coordinator?.proceedToSignUpPage()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == infoViewModel.count {
            let cell = collectionView.deque(LogInCell.self, for: indexPath)
            cell.delegate = self
            return cell
        } else {
            let cell = collectionView.deque(OnBoardingCell.self, for: indexPath)
            cell.configure(with: infoViewModel[indexPath.row])
            
            return cell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
               currentPage = Int(scrollView.contentOffset.x / width)
               DispatchQueue.main.async {
                   self.pageControl.currentPage = self.currentPage
               }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if infoViewModel.count  == 0 { return 0}
        let count = infoViewModel.count + 1
        
        pageControl.numberOfPages = count
        pageControl.isHidden = !(count > 1)
        
        return count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
}
