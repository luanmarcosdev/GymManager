//
//  RegisterGoalCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import Foundation
import UIKit

class RegisterGoalCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerGoalVC = RegisterGoalViewController()
        registerGoalVC.coordinator = self
        self.navigationController.pushViewController(registerGoalVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    func navigationToRegisterSuccess() {
        let registerSuccessCoordinator = RegisterSuccessCoordinator(navigationController: self.navigationController)
        registerSuccessCoordinator.start()
    }
    
}
