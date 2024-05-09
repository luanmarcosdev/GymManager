//
//  IndexCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import Foundation
import UIKit

class IndexCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = IndexViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigationToAboutScreen() {
        let aboutCoordinator = AboutCoordinator(navigationController: self.navigationController)
        aboutCoordinator.start()
    }
    
    func navigationToLoginScreen() {
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)
        loginCoordinator.start()
    }
    
    func navigationToRegisterScreen() {
        let indexRegisterCoordinator = RegisterIndexCoordinator(navigationController: self.navigationController)
        indexRegisterCoordinator.start()
    }
    
    
}
