//
//  HomeViewModel.swift
//  BaseApplication
//
//  Created by Wac on 11/01/22.
//  Copyright © 2022 Wac. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var arrayOfHome = [HomeModel]()
}

extension HomeViewModel {
    
    func setData() {
        let carouselModel = HomeModel()
        carouselModel.type = "CarouselBanner"
        carouselModel.bannerImage = [
            "https://tinyurl.com/y3w8oaah",
            "https://tinyurl.com/y4vaulog",
            "https://tinyurl.com/y3j7rq6g",
            "https://tinyurl.com/y28jpmyr",
            "https://tinyurl.com/y2w7fbdo",
            "https://tinyurl.com/yy2f6lha"
        ]
        
        arrayOfHome.append(carouselModel)
        
        let productModel = HomeModel()
        var arrayOFItems = [ItemsModel]()
        productModel.type = "Product"
        
        let productOne = ItemsModel()
        productOne.title = "TShirt"
        productOne.image = "https://tinyurl.com/y4f5e96j"
        productOne.discount = "Min 40% Off"
        arrayOFItems.append(productOne)
            
        let productTwo = ItemsModel()
        productTwo.title = "Shirt"
        productTwo.image = "https://tinyurl.com/y2szwrys"
        productTwo.discount = "Min 20% Off"
        arrayOFItems.append(productTwo)
            
        let productThree = ItemsModel()
        productThree.title = "TShirt"
        productThree.image = "https://tinyurl.com/y4bfj5b7"
        productThree.discount = "Min 40% Off"
        arrayOFItems.append(productThree)
            
        let productFour = ItemsModel()
        productFour.title = "Shirt"
        productFour.image = "https://tinyurl.com/y44marw5"
        productFour.discount = "Min 50% Off"
        arrayOFItems.append(productFour)
            
        let productFive = ItemsModel()
        productFive.title = "Shirt"
        productFive.image = "https://tinyurl.com/y4urobx8"
        productFive.discount = "Min 40% Off"
        arrayOFItems.append(productFive)
            
        let productSix = ItemsModel()
        productSix.title = "Lahanga"
        productSix.image = "https://tinyurl.com/y2yhf95n"
        productSix.discount = "Min 70% Off"
        arrayOFItems.append(productSix)
            
        let productSeven = ItemsModel()
        productSeven.title = "Churidar"
        productSeven.image = "https://tinyurl.com/y5n467o3"
        productSeven.discount = "Min 40% Off"
        arrayOFItems.append(productSeven)
            
        let productEight = ItemsModel()
        productEight.title = "Saree"
        productEight.image = "https://tinyurl.com/yxupqdll"
        productEight.discount = "Min 10% Off"
        arrayOFItems.append(productEight)
        
        productModel.items = arrayOFItems
        
        arrayOfHome.append(productModel)
        
        let bannerModel = HomeModel()
        bannerModel.type = "Banner"
        bannerModel.bannerImage = [
            "https://tinyurl.com/y379jw6s",
            "https://tinyurl.com/y3pjtea4",
            "https://tinyurl.com/y2gersqn",
            "https://tinyurl.com/y3c6ksu5",
            "https://tinyurl.com/y4k2klen",
            "https://tinyurl.com/y3pccdrc",
            "https://tinyurl.com/y26fn9rm"
        ]
        arrayOfHome.append(bannerModel)
    }
}
