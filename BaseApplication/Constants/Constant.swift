//
//  Constant.swift
//  BaseApplication
//
//  Created by Wac on 24/04/19.
//  Copyright © 2019 Wac. All rights reserved.
//

import Foundation
import UIKit

// Storyboards
let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

// Main window frame
let windowFrame = (UIApplication.shared.delegate?.window!!.frame)!

// One pixel
let onePixel = 1.0 / UIScreen.main.scale

// Appdelegate 
let appDelegate = UIApplication.shared.delegate as! AppDelegate

// 
typealias WebServiceCompletionHandler = (_ status:Bool, _ message:String?, _ responseObject:AnyObject?, _ error:NSError?) -> Void
