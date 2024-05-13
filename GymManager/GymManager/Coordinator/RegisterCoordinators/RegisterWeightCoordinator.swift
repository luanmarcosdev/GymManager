//
//  RegisterWeightCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import Foundation
import UIKit

class RegisterWeightCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerWeightVC = RegisterWeightViewController()
        registerWeightVC.coordinator = self
        self.navigationController.pushViewController(registerWeightVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    func navigationToRegisterGoalScreen() {
        let registerGoalCoordinator = RegisterGoalCoordinator(navigationController: self.navigationController)
        registerGoalCoordinator.start()
    }
    
    
}
