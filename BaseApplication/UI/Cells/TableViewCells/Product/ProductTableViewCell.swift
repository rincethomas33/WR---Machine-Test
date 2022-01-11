//
//  ProductTableViewCell.swift
//  BaseApplication
//
//  Created by Wac on 11/01/22.
//  Copyright © 2022 Wac. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    // MARK: - IB UI
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var arrayOfProducts = [ItemsModel]()
    
    // MARK: - Private methods
    fileprivate func registerCollectionViewCell() {
        let productNib = UINib(nibName: Identifier.CollectionView.product, bundle: nil)
        collectionView.register(productNib, forCellWithReuseIdentifier: Identifier.CollectionView.product)
    }
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCollectionViewCell()
    }
    
    // MARK: - Helper
    
    func configure(with model: HomeModel) {
        
        arrayOfProducts = model.items ?? []
        let count = arrayOfProducts.count/2
        collectionViewHeightConstraint.constant = CGFloat(count * 200)
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ProductTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let defaultCell = UICollectionViewCell()
        
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.CollectionView.product, for: indexPath) as? ProductCollectionViewCell else { return defaultCell }
        let products = arrayOfProducts[indexPath.row]
        cell.configure(with: products)
        
        return cell
    }
    
    
}

extension ProductTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let height =
        let width = (collectionView.frame.size.width) / 2
        return CGSize(width: width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
