//
//  ProfileVC.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 15/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class ProfileVC: UIViewController, GIDSignInUIDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setRightBarButton(logoutButton, animated: true)
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @objc
    private func logout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            GIDSignIn.sharedInstance().signOut()
            print("logging out")
            AppDelegate.shared.rootViewController.switchToLogout()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
