//
//  RegisterSucessCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import Foundation
import UIKit

class RegisterSucessCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerSucessVC = RegisterSucessViewController()
        registerSucessVC.coordinator = self
        self.navigationController.pushViewController(registerSucessVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }

}
