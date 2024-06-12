//
//  RegisterSucessViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterSuccessViewController: UIViewController {
    
    var registerSuccessView: RegisterSuccessView?
    
    var coordinator: RegisterSuccessCoordinator?
    
    override func loadView() {
        self.registerSuccessView = RegisterSuccessView()
        self.view = self.registerSuccessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerSuccessView?.setDelegate(delegate: self)
    }
    
}

extension RegisterSuccessViewController: RegisterSuccessViewDelegate {
    
    func actionSuccess() {
        self.coordinator?.navigationToHomeScreen()
    }
    
}
