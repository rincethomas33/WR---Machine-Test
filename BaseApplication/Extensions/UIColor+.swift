//
//  UIColor+.swift
//  BaseApplication
//
//  Created by Wac on 24/04/19.
//  Copyright © 2019 Wac. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func hex (hexStr : NSString, alpha : CGFloat) -> UIColor {
        
        let hexStr = hexStr.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string", terminator: "")
            return UIColor.white
        }
    }
    
    // Mark: -  Application Colors
    
    class var primary: UIColor {
        return hex(hexStr: "Your Color", alpha: 1.0)
    } /* Use as :- UIColor.primary */
    
}
