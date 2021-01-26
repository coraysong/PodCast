//
//  MainTabBarController.swift
//  PodCast
//
//  Created by Coray on 25/1/2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple
        
        setupViewControllers()
    }
    
    //MARK: Setup Functions
    func setupViewControllers() {
        
        viewControllers = [
            generateNavigationController(with: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            generateNavigationController(with: ViewController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(with: ViewController(), title: "Downloads", image: #imageLiteral(resourceName: "download"))
        ]
    }
    
    //MARK: Helper Functions
    fileprivate func generateNavigationController(with rootController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootController)
        rootController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
