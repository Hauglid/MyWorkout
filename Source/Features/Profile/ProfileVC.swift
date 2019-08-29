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
    
    @IBOutlet weak var backgroundExampleView: UIView!
    @IBOutlet weak var primaryExampleView: UIView!
    @IBOutlet weak var secondaryExampleView: UIView!
    @IBOutlet weak var tertiaryExampleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        setUpTheming()
        setupView()
    }
    
    func setupView() {
        setupButtonView()
        title = "Profile"
    }
    
    func setupButtonView() {
        // add border to stackview
        btnThemeView.clipsToBounds = true
        btnThemeView.layer.borderColor = UIColor.black.cgColor
        btnThemeView.layer.borderWidth = 1
        btnThemeView.layer.cornerRadius = 30
    }
    
    @IBAction func lightButtonTapped(_ sender: Any) {
        themeProvider.currentTheme = AppTheme.light

    }
    @IBAction func darkButtonTapped(_ sender: Any) {
        themeProvider.currentTheme = AppTheme.dark
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

extension ProfileVC: Themed{
    func applyTheme(_ theme: AppTheme) {
        view.backgroundColor = theme.backgroundColor
    }
    
    
}
