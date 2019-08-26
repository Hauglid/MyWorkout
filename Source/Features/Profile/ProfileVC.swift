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
    
    @IBOutlet weak var lightButton: UIButton!
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var btnThemeView: UIView!
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var backgroundExampleView: UIView!
    @IBOutlet weak var primaryExampleView: UIView!
    @IBOutlet weak var secondaryExampleView: UIView!
    @IBOutlet weak var tertiaryExampleView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // add border to stackview
        btnThemeView.clipsToBounds = true
        btnThemeView.layer.borderColor = UIColor.black.cgColor
        btnThemeView.layer.borderWidth = 1
        btnThemeView.layer.cornerRadius = 30
        title = "Profile"
        updateTheme()
    }
    
    
    
    @IBAction func lightButtonTapped(_ sender: Any) {
        Theme.Light.apply()
        updateTheme()
    }
    @IBAction func darkButtonTapped(_ sender: Any) {
        Theme.Dark.apply()
        updateTheme()
    }
   
    func updateTheme() {
        // Update Example views
        backgroundView.backgroundColor = Theme.current.backgroundColor
        backgroundExampleView.backgroundColor = Theme.current.backgroundColor
        primaryExampleView.backgroundColor = Theme.current.primaryColor
        secondaryExampleView.backgroundColor = Theme.current.secondaryColor
        tertiaryExampleView.backgroundColor = Theme.current.tertiaryColor
        
        
        self.navigationController?.navigationBar.barTintColor = Theme.current.backgroundColor
        self.navigationController?.navigationBar.titleTextAttributes = Theme.Helper.getNavigationTitleTextAttributes()
        
        self.tabBarController?.tabBar.barTintColor = Theme.current.backgroundColor
    }
    
    @IBAction func logoutBtnTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            GIDSignIn.sharedInstance().signOut()
            print("logging out")
            AppDelegate.shared.rootViewController.switchToLogout()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        } }
}
