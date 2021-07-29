//
//  CategoryCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit
import Kingfisher

protocol clickedCell : AnyObject {
    func goEachCategoryCollectionView(catsData:[Products])
}

class CategoryCell: UITableViewCell {
    
    weak var delegate: clickedCell?
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private properties
    private var eachCategory: EachCategoryManagerProtocol!
    
    private var categoryViewModel =  [HomeViewModel]()
    private var categoryManager: CategoryManagerProtocol!
    private var eachManager: EachCategoryManagerProtocol!
    
    var point: Int?
    //    var data = [Products]()
    var messages: [Products] = []
    var category = [HomeViewModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        eachCategory = EachCategoryManager()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(class: CategoryItemCell.self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with category: [HomeViewModel]) {
        self.category = category
    }
    
    
}

extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(CategoryItemCell.self, for: indexPath)
        cell.categoryItemLabel.text = category[indexPath.row].categoryModel.title
        cell.categoryImg.kf.setImage(with: category[indexPath.row].categoryModel.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let categoryType = category[indexPath.row].categoryModel.type else { return }
        eachCategory.fetchEachCategory(with: categoryType) { mens in
            DispatchQueue.main.async {
                print(mens)
                do{
                    self.messages = try mens.get()
                    print(self.messages)
                    self.delegate?.goEachCategoryCollectionView(catsData: self.messages)
                }
                catch{
                    print("catch")
                }
                
                
            }
        }
        
    }
}

extension CategoryCell: UICollectionViewDelegate {
    
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
}

