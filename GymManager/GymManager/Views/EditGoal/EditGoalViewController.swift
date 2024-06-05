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
    
    override func loadView() {
        self.editGoalView = EditGoalView()
        self.view = editGoalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.editGoalView?.setDelegate(delegate: self)
    }

}

extension EditGoalViewController: EditGoalViewDelegate {
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionConfirm() {
        print("to do")
    }
    
    
}
