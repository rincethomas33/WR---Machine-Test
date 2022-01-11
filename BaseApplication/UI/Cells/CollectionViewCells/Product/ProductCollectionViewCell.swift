//
//  ProductCollectionViewCell.swift
//  BaseApplication
//
//  Created by Wac on 11/01/22.
//  Copyright © 2022 Wac. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IB UI
    
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layer = bgView.layer
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.hex(hexStr: "e5e5e5", alpha: 1).cgColor
    }
    
    // MARK: - Helper
    
    func configure(with model: ItemsModel) {
        discountLabel.text = model.discount ?? ""
        productNameLabel.text = model.title ?? ""
        
        let imageUrl = model.image ?? ""
        guard let url = URL(string: imageUrl) else { return }
        productImageView.af_setImage(withURL: url)
    }

}
