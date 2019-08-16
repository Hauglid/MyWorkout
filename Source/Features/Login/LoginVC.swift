//
//  ViewController.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 06/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginVC: UIViewController, GIDSignInUIDelegate {
    var handle: AuthStateDidChangeListenerHandle?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Login Screen"
        let loginButton = UIBarButtonItem(title: "Log In", style: .plain, target: self, action: #selector(login))
        navigationItem.setLeftBarButton(loginButton, animated: true)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        handle = Auth.auth().addStateDidChangeListener() { (auth, user) in
            if user != nil {
                AppDelegate.shared.rootViewController.switchToMainScreen()
            }
        }
    }
    
    @objc private func login() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
