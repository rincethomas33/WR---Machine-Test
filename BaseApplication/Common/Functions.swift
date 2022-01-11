//
//  Functions.swift
//  BaseApplication
//
//  Created by Wac on 24/04/19.
//  Copyright © 2019 Wac. All rights reserved.
//

import Foundation
import UIKit

// To display toast messages
func displayToastMessage(_ message : String) {
    
    DispatchQueue.main.async {
        let toastView = UILabel()
        toastView.backgroundColor = UIColor.black
        toastView.textColor = UIColor.white
        toastView.textAlignment = .center
        toastView.layer.cornerRadius = 10
        toastView.font = UIFont.preferredFont(forTextStyle: .caption1)
        toastView.layer.masksToBounds = true
        
        toastView.text = message
        toastView.numberOfLines = 0
        toastView.alpha = 0
        toastView.translatesAutoresizingMaskIntoConstraints = false
        
        let window = UIApplication.shared.delegate?.window!
        window?.addSubview(toastView)
        
        let horizontalCenterContraint = NSLayoutConstraint(
            item: toastView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: window,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        
        let widthContraint = NSLayoutConstraint(
            item: toastView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .width,
            multiplier: 1,
            constant: 275
        )
        
        let verticalContraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-(>=200)-[loginView(==50)]-200-|",
            options: [
                .alignAllCenterX,
                .alignAllCenterY
            ],
            metrics: nil,
            views: ["loginView": toastView]
        )
        
        NSLayoutConstraint.activate([horizontalCenterContraint, widthContraint])
        NSLayoutConstraint.activate(verticalContraint)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            toastView.alpha = 1
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(3 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                toastView.alpha = 0
            }, completion: { finished in
                toastView.removeFromSuperview()
            })
        })
    }
}

// Make a call to number
func makeCall(to number: String) {
    if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    } else {
        displayToastMessage("Unable to call")
    }
}

// Open url from app
func openUrl(of urlString: String) {
    guard let url = URL(string: urlString) else {
        return //be safe
    }
    
    if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
        UIApplication.shared.openURL(url)
    }
}

func share(with textToShare: String, urlToShare: String, viewController: UIViewController) {
    if let myWebsite = NSURL(string: urlToShare) {
        let objectsToShare = [textToShare, myWebsite] as [Any]
        let activityVC = UIActivityViewController(
            activityItems: objectsToShare,
            applicationActivities: nil
        )
        
        //New Excluded Activities Code
        
        activityVC.excludedActivityTypes = [
            UIActivity.ActivityType.airDrop,
            UIActivity.ActivityType.addToReadingList
        ]
        //
        viewController.present(activityVC, animated: true, completion: nil)
    }
}

//Network errors
func checkNetworkError(_ error:Error) -> String {
    switch error._code {
    case NSURLErrorTimedOut:
        return "Connection time out error, Please try again later."
    case NSURLErrorCannotConnectToHost:
        return "Server is not available, Please try again later."
    case NSURLErrorCannotFindHost:
        return "Host is not available, Please try again later."
    case NSURLErrorNetworkConnectionLost:
        return "Network Connection is not available, Please try again later."
    case NSURLErrorNotConnectedToInternet:
        return "It seems that there is no Internet connection."
    default:
        return "Please try again later."
    }
    
}
