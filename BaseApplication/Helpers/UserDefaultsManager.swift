//
//  UserDefaultsManager.swift
//  BaseApplication
//
//  Created by Wac on 24/04/19.
//  Copyright © 2019 Wac. All rights reserved.
//

import Foundation

class UserDefaultsManager: UserDefaults {
    
    static let shared = UserDefaultsManager()
    
    fileprivate var preference: UserDefaults = {
        return UserDefaults.standard
    }()
    
    func save() {
        preference.synchronize()
    }
}
