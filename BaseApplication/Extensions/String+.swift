//
//  String+.swift
//  BaseApplication
//
//  Created by Wac on 24/04/19.
//  Copyright © 2019 Wac. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    // check empty textfield
    var isBlank: Bool {
        let trimmedText = self.trimWhiteSpaces()
        return trimmedText.isEmpty
    }
    
    // Trim all white space
    func trimWhiteSpaces() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    // Trim the character in string
    func trimCharacters(in set: String) -> String {
        let change = CharacterSet(charactersIn: set)
        return self.trimmingCharacters(in: change)
    }
    
    // Validate email id
    var isValidEmail:  Bool {
        if isBlank {
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    } // use as: - "your email".isvalidEmail
    
    // Validate Password
    var isValidPassword: Bool {
        if isBlank {
            return false
        }
        let passwordRegex = "^([0-9]+[a-zA-Z]+|[a-zA-Z]+[0-9]+)[0-9a-zA-Z]*$"
        let passwordText = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordText.evaluate(with: self)
    } // use as: - "your email".isvalidPassword
    
    // Get localized string
    var localized: String {
        return NSLocalizedString(self, comment: "")
    } // use as:- "your string".localized
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    var capitalized: String! {
        return self.capitalizingFirstLetter()
    }
    
    func capitalizeFirst() -> String {
        let splited = self.components(separatedBy: " ")
        var capitalized = [String]()
        for str in splited {
            let capitalizedString = str.capitalized
            capitalized.append(capitalizedString!)
        }
        return capitalized.joined(separator: " ")
    }
}
