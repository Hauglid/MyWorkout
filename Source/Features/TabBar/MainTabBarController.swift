//
//  MainTabBarController.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 15/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftIcons

class MainTabBarController: AppTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            
            getNavigationController(vc: CurrentWorkoutVC(), title: "Workout", icon: .googleMaterialDesign(.fitnessCenter)),
            getNavigationController(vc: HistoryVC(), title: "Previous", icon: .fontAwesomeSolid(.history)),
            getNavigationController(vc: ProfileVC(), title: "Settings", icon: .fontAwesomeSolid(.userCog))
        ]
        
    }
    
    func getNavigationController(vc: UIViewController,title: String, icon: FontType ) -> UINavigationController{
        
        let navController = AppNavigationController(rootViewController: vc)
        navController.tabBarItem.setIcon(icon: icon)
        navController.tabBarItem.selectedImage = navController.tabBarItem.selectedImage?.withRenderingMode(.alwaysTemplate)
        navController.tabBarItem.image = navController.tabBarItem.image?.withRenderingMode(.alwaysTemplate)
        navController.tabBarItem.title = title
        return navController
    }
    
}
