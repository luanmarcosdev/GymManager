//
//  AddWorksheetVC.swift
//  GymManager
//
//  Created by Luan Arruda on 05/06/24.
//

import UIKit

class AddWorksheetVC: UIViewController {
    
    var coordinator: AddWorksheetCoordinator?
    var addWorksheetView: AddWorksheetView?
    var addWorksheetViewModel: AddWorksheetViewModel?
    var exercises: [Exercise]?
    
    override func loadView() {
        self.addWorksheetView = AddWorksheetView()
        self.view = addWorksheetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addWorksheetView?.setDelegate(delegate: self, tableViewDelegate: self, tableViewDataSource: self)
        self.addWorksheetViewModel = AddWorksheetViewModel()
        self.exercises = []
    }
    
}

extension AddWorksheetVC: AddWorksheetViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionAddExercise() {
         
        self.addWorksheetViewModel?.addExercise(viewController: self, completion: { exercise in
            if let exercise = exercise {
                self.exercises?.append(exercise)
                self.addWorksheetView?.exercisesTableView.reloadData()
            }
        })
        
    }
    
    func actionSaveButton() {
        print("tapped save button")
    }
    
    
}

extension AddWorksheetVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}

extension AddWorksheetVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ExerciseTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.identifier, for: indexPath) as? ExerciseTableViewCell
        
        guard let exercises = self.exercises, let cell = cell else {return UITableViewCell()}
        
        cell.nameLabel.text = exercises[indexPath.row].name
        cell.weightLabel.text = "\(exercises[indexPath.row].weight)"
        
        return cell
    }
    
}
