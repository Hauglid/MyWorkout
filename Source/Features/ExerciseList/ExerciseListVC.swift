//
//  ExerciseListVC.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 12/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase

class ExerciseListVC: UIViewController {
    var exercises = [Exercise]()
    let reuseIdentifier = "AddExerciseCell"
    var selectionDelegate: ExerciseListDelegate!    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Exercises"
        self.getData()
        // Do any additional setup after loading the view.
    }
    func getData(){
        let db = Firestore.firestore()
        var exercises = [Exercise]()
        
        db.collection("exercises").order(by: "name").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let exercise = try! FirestoreDecoder().decode(Exercise.self, from: document.data())
                    exercises.append(exercise)
                }
                self.exercises = exercises
                self.tableView.reloadData()
            }
        }
    }
    
}

extension ExerciseListVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)

        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        
        let exercise = exercises[indexPath.row]
        cell.textLabel?.text = exercise.name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectionDelegate.didTapExercise(exercise: exercises[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
    
}
