//
//  RegisterAgeViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import UIKit

class RegisterAgeViewController: UIViewController {
    
    var coordinator: RegisterAgeCoordinator?
    
    var registerAgeView: RegisterAgeView?
    
    override func loadView() {
        self.registerAgeView = RegisterAgeView()
        self.view = registerAgeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerAgeView?.setDelegate(delegate: self)
    }

}

extension RegisterAgeViewController: RegisterAgeViewDelegate {
    
    func actionNext() {
        self.coordinator?.navigationToRegisterHeightScreen()
    }
    
    func actionBack() {
        self.coordinator?.back()
    }
    
}
