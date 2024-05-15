//
//  RegisterIndexViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import UIKit

class RegisterIndexViewController: UIViewController {
    
    var coordinator: RegisterIndexCoordinator?
    
    var registerIndexView: RegisterIndexView?
    
    override func loadView() {
        self.registerIndexView = RegisterIndexView()
        self.view = self.registerIndexView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerIndexView?.setDelegate(delegate: self)
    }

}

extension RegisterIndexViewController: RegisterIndexViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionRegister() {
        self.coordinator?.navigationToRegisterGender()
    }
    
    
}
