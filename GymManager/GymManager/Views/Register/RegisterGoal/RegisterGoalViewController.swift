//
//  RegisterGoalViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterGoalViewController: UIViewController {
    
    var coordinator: RegisterGoalCoordinator?
    
    var registerGoalView: RegisterGoalView?
    
    override func loadView() {
        self.registerGoalView = RegisterGoalView()
        self.view = self.registerGoalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerGoalView?.setDelegate(delegate: self)
    }

}

extension RegisterGoalViewController: RegisterGoalViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionFinish() {
        self.coordinator?.navigationToHomeScreen()
    }
    
}
