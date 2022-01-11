//
//  UIView+.swift
//  BaseApplication
//
//  Created by Wac on 24/04/19.
//  Copyright © 2019 Wac. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: self, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(self)
    }
}
