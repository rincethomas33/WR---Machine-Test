//
//  CarouselBannerTableViewCell.swift
//  BaseApplication
//
//  Created by Wac on 11/01/22.
//  Copyright © 2022 Wac. All rights reserved.
//

import UIKit

class CarouselBannerTableViewCell: UITableViewCell {
    
    // MARK: - IB UI
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    // Constraint
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var arrayOfImages = [String]()
    
    // MARK: - Private methods
    
    fileprivate func registerCollectionViewCell() {
        let carouselBanerNib = UINib(nibName: Identifier.CollectionView.carouselBanner, bundle: nil)
        collectionView.register(carouselBanerNib, forCellWithReuseIdentifier: Identifier.CollectionView.carouselBanner)
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        registerCollectionViewCell()
        
        collectionViewHeightConstraint.constant = 20/100 * windowFrame.height
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Helper
    
    func configure(with model: HomeModel) {
        arrayOfImages = model.bannerImage ?? []
        pageController.numberOfPages = arrayOfImages.count
        collectionView.reloadData()
    }
    
    
}

extension CarouselBannerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let defaultCell = UICollectionViewCell()
        
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.CollectionView.carouselBanner, for: indexPath) as? CarouselCollectionViewCell else { return defaultCell }
        
        let image = arrayOfImages[indexPath.row]
        cell.configure(with: image)
        
        return cell
    }
    
    
}

extension CarouselBannerTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = collectionView.frame.size.width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if pageController.currentPage == indexPath.row {
            guard let visible = collectionView.visibleCells.first else { return }
            guard let index = collectionView.indexPath(for: visible)?.row else { return }
            pageController.currentPage = index
        }
    }
    
}
