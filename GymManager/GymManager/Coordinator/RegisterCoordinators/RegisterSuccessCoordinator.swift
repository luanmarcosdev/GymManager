//
//  RegisterSucessCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import Foundation
import UIKit

class RegisterSuccessCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerSuccessVC = RegisterSuccessViewController()
        registerSuccessVC.coordinator = self
        self.navigationController.pushViewController(registerSuccessVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func navigationToHomeScreen() {
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        homeCoordinator.start()
    }

}
