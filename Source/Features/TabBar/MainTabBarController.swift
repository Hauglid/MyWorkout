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
        let currentWorkoutVC = CurrentWorkoutVC()
        let currentWorkoutNavigationController = UINavigationController(rootViewController: currentWorkoutVC)
        currentWorkoutNavigationController.tabBarItem.image = UIImage(named: "person")
        
        let historyVC = HistoryVC()
        let homeNavigationController = UINavigationController(rootViewController: historyVC)
        homeNavigationController.tabBarItem.image = UIImage(named: "dumbbell")
        
        
        let userProfileController = ProfileVC()
        let userProfileNavigationController = UINavigationController(rootViewController: userProfileController)
        userProfileNavigationController.tabBarItem.image = UIImage(named: "person")
                
        viewControllers = [currentWorkoutNavigationController, homeNavigationController, userProfileNavigationController]
        
    }
    
}
