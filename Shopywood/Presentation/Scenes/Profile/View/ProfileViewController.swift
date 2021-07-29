//
//  ProfileViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit

class ProfileViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private properties
    private var dataSource: ProfileDataSource!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
    }
    

    private func setupLayout() {
        collectionView.registerNib(class: ProfileItemCell.self)
        collectionView.register(
            UINib(nibName: "ProfileHeaderCell", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "ProfileHeaderCell")
    }
    
    private func configureViewModel() {
        dataSource = ProfileDataSource(with: collectionView, coordinator: coordinator!, navigationController: self.navigationController)
    }

}
