//
//  EditGoalViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 10/06/24.
//

import UIKit

class EditGoalSuccessVC: UIViewController {
    
    var coordinator: EditGoalSuccessCoordinator?
    var editGoalSuccessView: EditGoalSuccessView?
    
    override func loadView() {
        self.editGoalSuccessView = EditGoalSuccessView()
        self.view = self.editGoalSuccessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.editGoalSuccessView?.setDelegate(delegate: self)
    }

}

extension EditGoalSuccessVC: EditGoalSuccessViewDelegate {
    
    func actionSuccess() {
        self.coordinator?.navigationToHomeScreen()
    }

}
