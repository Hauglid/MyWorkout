//
//  HomeVC.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 12/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func startNewWorkout(_ sender: Any) {
        let currentWorkoutVC = CurrentWorkoutVC(nibName: "CurrentWorkoutVC", bundle: nil)
        self.navigationController?.pushViewController(currentWorkoutVC, animated: true)
        
    }
    
}
