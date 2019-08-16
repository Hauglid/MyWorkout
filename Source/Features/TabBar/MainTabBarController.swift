//
//  MainTabBarController.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 15/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        let homeController = HomeVC()
        let homeNavigationController = UINavigationController(rootViewController: homeController)
        homeNavigationController.tabBarItem.image = UIImage(named: "dumbbell")
        homeNavigationController.tabBarItem.selectedImage = UIImage(named: "dumbbell")
        
        let userProfileController = ProfileVC()
        let userProfileNavigationController = UINavigationController(rootViewController: userProfileController)
        userProfileNavigationController.tabBarItem.image = UIImage(named: "person")
        userProfileNavigationController.tabBarItem.selectedImage = UIImage(named: "person")
        
        viewControllers = [homeNavigationController, userProfileNavigationController]
        
    }
    
}
