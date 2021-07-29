//
//  WelcomeViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import UIKit

class WelcomeViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Private properties
    private var viewModel: WelcomeViewModelProtocol!
    private var dataSource: WelcomeDataSource!
    private var apiManager: OnBoardingManagerProtocol!
    
    var i: Int = 0
    var isLoading: Bool = false
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.registerNib(class: OnBoardingCell.self)
        collectionView.registerNib(class: LogInCell.self)
        

        configureViewModel()
        self.navigationController?.navigationBar.isHidden = true
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    private func configureViewModel() {
        apiManager = OnBoardingManager()
        viewModel = WelcomesViewModel(with: apiManager!, navigationController: self.navigationController, pageControl: self.pageControl)
        dataSource = WelcomeDataSource(with: collectionView,
                                       viewModel: viewModel, pageControl: pageControl, coordinator: coordinator!)
        
        dataSource.refresh()
    }
    

    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(x : contentOffset ,y : self.collectionView.contentOffset.y ,width : self.collectionView.frame.width,height : self.collectionView.frame.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
    
}

