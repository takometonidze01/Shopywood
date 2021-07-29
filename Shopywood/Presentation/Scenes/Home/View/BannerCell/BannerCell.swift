//
//  BannerCell.swift
//  Shopywood
//
//  Created by CodergirlTM on 19.07.21.
//

import UIKit

class BannerCell: UITableViewCell {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var timer: Timer?
    var currentIndexPath = 0
    let productGalleryImages = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        setUpTimer()
        setUpPageControl()
    }
    func setUpCollectionView(){
        collectionView.registerNib(class: BannerItemCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
    }
    func setUpTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(moveProductImage), userInfo: nil, repeats: true)
    }
    @objc func moveProductImage(){
        if currentIndexPath < productGalleryImages.count - 1 {
            currentIndexPath += 1
        }else{
            currentIndexPath = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentIndexPath, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentIndexPath
    }
    func setUpPageControl(){
        pageControl.numberOfPages = productGalleryImages.count
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
extension BannerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productGalleryImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(BannerItemCell.self, for: indexPath)
        cell.bannerImage.image = productGalleryImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
