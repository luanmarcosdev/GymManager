//
//  LoginViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var coordinator: LoginCoordinator?
    
    var loginView: LoginView?
    
    override func loadView() {
        self.loginView = LoginView()
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}
