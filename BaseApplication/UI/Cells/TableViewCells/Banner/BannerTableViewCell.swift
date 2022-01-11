//
//  BannerTableViewCell.swift
//  BaseApplication
//
//  Created by Wac on 11/01/22.
//  Copyright © 2022 Wac. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    
    // MARK: - IB UI
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var arrayOfImage = [String]()
    
    // MARK: - Private methods
    
    fileprivate func registerCollectionViewCell() {
        let bannerNib = UINib(nibName: Identifier.CollectionView.carouselBanner, bundle: nil)
        collectionView.register(bannerNib, forCellWithReuseIdentifier: Identifier.CollectionView.carouselBanner)
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCollectionViewCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Helper
    
    func configure(with model: HomeModel) {
        
        arrayOfImage = model.bannerImage ?? []
        collectionView.reloadData()
    }
    
}

extension BannerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultCell = UICollectionViewCell()
        
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.CollectionView.carouselBanner, for: indexPath) as? CarouselCollectionViewCell else { return defaultCell }
        let image = arrayOfImage[indexPath.row]
        cell.configure(with: image)
        
        return cell
    }
    
    
}

extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = collectionView.frame.size.width - 20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
