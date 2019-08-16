//
//  SplashVC.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 13/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import UIKit
import Firebase

class SplashVC: UIViewController {
    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        let user = Auth.auth().currentUser
        
        if user != nil {
            self.activityIndicator.stopAnimating()
            AppDelegate.shared.rootViewController.showLoginScreen()
            
        } else {
            AppDelegate.shared.rootViewController.showLoginScreen()
        }
        
        
    }
    
}
