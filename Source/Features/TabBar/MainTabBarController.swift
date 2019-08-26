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

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
           
            getNavigationController(vc: CurrentWorkoutVC(), title: "Workout", icon: .googleMaterialDesign(.fitnessCenter)),
            getNavigationController(vc: HistoryVC(), title: "Previous", icon: .fontAwesomeSolid(.history)),
            getNavigationController(vc: ProfileVC(), title: "Settings", icon: .fontAwesomeSolid(.userCog))
        ]
        
    }
    
    func getNavigationController(vc: UIViewController,title: String, icon: FontType ) -> UINavigationController{
        let selectedColor: UIColor = Theme.current.primaryColor
        let unselectedColor: UIColor = .lightGray
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.setIcon(icon: icon, size: nil, textColor: unselectedColor, selectedTextColor: selectedColor )
        navController.tabBarItem.title = title
        return navController
    }
    
}
