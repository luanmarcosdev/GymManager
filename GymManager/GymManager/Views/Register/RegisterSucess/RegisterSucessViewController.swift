//
//  RegisterSucessViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterSucessViewController: UIViewController {
    
    var registerSucessView: RegisterSucessView?
    
    var coordinator: RegisterSucessCoordinator?
    
    override func loadView() {
        self.registerSucessView = RegisterSucessView()
        self.view = self.registerSucessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerSucessView?.setDelegate(delegate: self)
    }
    
}

extension RegisterSucessViewController: RegisterSucessViewDelegate {
    
    func actionSuccess() {
        self.coordinator?.navigationToRegisterGenderScreen()
    }
    
}
