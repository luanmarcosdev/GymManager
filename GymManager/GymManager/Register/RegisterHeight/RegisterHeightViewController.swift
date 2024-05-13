//
//  RegisterHeightViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 10/05/24.
//

import UIKit

class RegisterHeightViewController: UIViewController {
    
    var coordinator: RegisterHeightCoordinator?
    
    var registerHeightView: RegisterHeightView?
    
    override func loadView() {
        self.registerHeightView = RegisterHeightView()
        self.view = self.registerHeightView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerHeightView?.setDelegate(delegate: self)
    }

}

extension RegisterHeightViewController: RegisterHeightViewDelegate {
    
    func actionNext() {
        self.coordinator?.navigationToRegisterWeightScreen()
    }
    
    func actionBack() {
        self.coordinator?.back()
    }
    
}
