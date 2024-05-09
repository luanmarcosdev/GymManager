//
//  LoginCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import Foundation
import UIKit

class LoginCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func navigationToForgotScreen() {
        let forgotCoordinator = ForgotCoordinator(navigationController: self.navigationController)
        forgotCoordinator.start()
    }
    
    func navigationToRegisterScreen() {
        let indexRegisterCoordinator = RegisterIndexCoordinator(navigationController: self.navigationController)
        indexRegisterCoordinator.start()
    }
    
}
