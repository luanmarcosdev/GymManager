//
//  RegisterHeightCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 10/05/24.
//

import Foundation
import UIKit

class RegisterHeightCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerHeightVC = RegisterHeightViewController()
        registerHeightVC.coordinator = self
        self.navigationController.pushViewController(registerHeightVC, animated: true)
        self.navigationController.navigationController?.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    func navigationToRegisterWeightScreen() {
        let registerWeightCoordinator = RegisterWeightCoordinator(navigationController: self.navigationController)
        registerWeightCoordinator.start()
    }
    
}
