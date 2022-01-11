//
//  CarouselCollectionViewCell.swift
//  BaseApplication
//
//  Created by Wac on 11/01/22.
//  Copyright © 2022 Wac. All rights reserved.
//

import UIKit
import AlamofireImage

class CarouselCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IB UI
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Helper
    
    func configure(with image: String) {
        guard let url = URL(string: image) else { return }
        
        bannerImageView.af_setImage(withURL: url)
    }

}
