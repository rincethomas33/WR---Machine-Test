//
//  HomeViewController.swift
//  BaseApplication
//
//  Created by Wac on 11/01/22.
//  Copyright © 2022 Wac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IB UI
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    let viewModel = HomeViewModel()
    
    // MARK: - Private methods
    
    fileprivate func registerTableViewCell() {
        // Carousel Banner
        let carouselNib = UINib(nibName: Identifier.TableView.carouselBanner, bundle: nil)
        tableView.register(carouselNib, forCellReuseIdentifier: Identifier.TableView.carouselBanner)
        
        let bannerNib = UINib(nibName: Identifier.TableView.banner, bundle: nil)
        tableView.register(bannerNib, forCellReuseIdentifier: Identifier.TableView.banner)
        
        let productNib = UINib(nibName: Identifier.TableView.product, bundle: nil)
        tableView.register(productNib, forCellReuseIdentifier: Identifier.TableView.product)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1
        viewModel.setData()
        
        // 2
        registerTableViewCell()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: -

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayOfHome.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let defaultCell = UITableViewCell()
        
        let homeModel = viewModel.arrayOfHome[indexPath.row]
        let type = homeModel.type ?? ""
        
        switch type {
        case "CarouselBanner":
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.TableView.carouselBanner, for: indexPath) as? CarouselBannerTableViewCell else { return defaultCell }
            
            cell.configure(with: homeModel)
            
            return cell
        case "Product":
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.TableView.product, for: indexPath) as? ProductTableViewCell else { return defaultCell }
            
            cell.configure(with: homeModel)
            
            return cell
        case "Banner":
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.TableView.banner, for: indexPath) as? BannerTableViewCell else { return defaultCell }
            
            cell.configure(with: homeModel)
            
            return cell
        default:
            return defaultCell
        }

    }
}


extension HomeViewController: UITabBarDelegate {
    
}
