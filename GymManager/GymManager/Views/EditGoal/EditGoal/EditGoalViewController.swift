//
//  EditGoalViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 05/06/24.
//

import UIKit

class EditGoalViewController: UIViewController {
    
    var coordinator: EditGoalCoordinator?
    var editGoalView: EditGoalView?
    var editGoalViewModel: EditGoalViewModel?
    var user: User?
    var newGoal: Int?
    
    override func loadView() {
        self.editGoalView = EditGoalView()
        self.view = editGoalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.editGoalView?.setDelegate(delegate: self, TFDelegate: self)
        self.editGoalViewModel = EditGoalViewModel()
    }

}

extension EditGoalViewController: EditGoalViewDelegate {
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionConfirm() {
        
        guard let goal = self.newGoal,
              var user = self.user,
              let validate = self.editGoalViewModel?.validateGoal(goal: goal, viewController: self) else {return}
        
        if validate {
            user.goal = goal
            self.editGoalViewModel?.saveNewGoal(user: user)
            
            // to do apresentar tela de confirmacão
        } else {
            
            //to do apresentar tela alert de error
        }
        
    }
    
}

extension EditGoalViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = self.editGoalView?.goalTextField.text,
              let button = self.editGoalView?.confirmButton else {return}
        
        let numberGoal = self.editGoalViewModel?.validateTextfield(goal: text, button: button)
        
        if let goal = numberGoal {
            self.newGoal = goal
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let textField = self.editGoalView?.goalTextField {
            textField.resignFirstResponder()
        }
        
        return true
    }

    
}
