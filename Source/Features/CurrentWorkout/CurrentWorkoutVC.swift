//
//  CurrentWorkoutVC.swift
//  MyWorkout
//
//  Created by Thomas Hauglid on 12/08/2019.
//  Copyright © 2019 Thomas Hauglid. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase

class CurrentWorkoutVC: UIViewController {
    let reuseIdentifier = "ExerciseCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    var exercises = [Exercise]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getData()
        dateLabel.text = "19. juli"
        let button1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(getExercises))
        self.navigationItem.rightBarButtonItem  = button1
        
    }
    
    @objc func getExercises(_ sender: Any) {
        let exerciseListVC = ExerciseListVC(nibName: "ExerciseListVC", bundle: nil)
        exerciseListVC.selectionDelegate = self
        self.navigationController?.pushViewController(exerciseListVC, animated: true)
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

extension CurrentWorkoutVC : UITableViewDataSource, UITableViewDelegate{
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
    
}

extension CurrentWorkoutVC: ExerciseListDelegate{
    func didTapExercise(exercise: Exercise) {
        exercises.append(exercise)
        self.tableView.reloadData()
    }
    
}
