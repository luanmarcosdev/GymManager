//
//  RegisterWeightViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterWeightViewController: UIViewController {
    
    var coordinator: RegisterWeightCoordinator?
    
    var registerWeightView: RegisterWeightView?
    
    override func loadView() {
        self.registerWeightView = RegisterWeightView()
        self.view = self.registerWeightView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerWeightView?.setDelegate(delegate: self)
    }
    
}

extension RegisterWeightViewController: RegisterWeightViewDelegate {
    
    func actionNext() {
        self.coordinator?.navigationToRegisterGoalScreen()
    }
    
    func actionBack() {
        self.coordinator?.back()
    }
    
}
