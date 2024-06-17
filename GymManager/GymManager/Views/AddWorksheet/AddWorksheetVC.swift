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
    var user: User?
    
    override func loadView() {
        self.addWorksheetView = AddWorksheetView()
        self.view = addWorksheetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addWorksheetView?.setDelegate(delegate: self, tableViewDelegate: self, tableViewDataSource: self, tfDelegate: self)
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
    
        guard let user = self.user,
              let title = self.addWorksheetView?.idTextField.text,
              let description = self.addWorksheetView?.descriptionTextField.text,
              let exercises = self.exercises else {return}
        
        self.addWorksheetViewModel?.saveNewWorksheet(title: title, description: description, exercises: exercises, user: user)
        
    }
    
    
}

extension AddWorksheetVC: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let id = self.addWorksheetView?.idTextField.text,
              let description = self.addWorksheetView?.descriptionTextField.text,
              let button = self.addWorksheetView?.saveButton else {return}
        
        self.addWorksheetViewModel?.validateTextField(id: id, description: description, button: button)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == addWorksheetView?.idTextField {
            self.addWorksheetView?.descriptionTextField.becomeFirstResponder()
            return true
        } else {
            self.addWorksheetView?.descriptionTextField.resignFirstResponder()
            return true
        }
        
    }
    
}

extension AddWorksheetVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            exercises?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
         return "Apagar"
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
