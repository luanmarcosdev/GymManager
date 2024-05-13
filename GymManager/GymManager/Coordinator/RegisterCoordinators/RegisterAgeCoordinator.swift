//
//  RegisterAgeCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import Foundation
import UIKit

class RegisterAgeCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerAgeVC = RegisterAgeViewController()
        registerAgeVC.coordinator = self
        self.navigationController.pushViewController(registerAgeVC, animated: true)
        self.navigationController.navigationController?.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    func navigationToRegisterHeightScreen() {
        let registerHeightCoordinator = RegisterHeightCoordinator(navigationController: self.navigationController)
        registerHeightCoordinator.start()
    }
    
}
