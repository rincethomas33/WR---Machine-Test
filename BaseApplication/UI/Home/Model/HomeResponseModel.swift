//
//  HomeResponseModel.swift
//  BaseApplication
//
//  Created by Wac on 11/01/22.
//  Copyright © 2022 Wac. All rights reserved.
//

import Foundation


class HomeModel: NSObject {
    var type: String?
    var bannerImage: [String]?
    var items: [ItemsModel]?
}

class ItemsModel: NSObject {
    var title: String?
    var image: String?
    var discount: String?
}
