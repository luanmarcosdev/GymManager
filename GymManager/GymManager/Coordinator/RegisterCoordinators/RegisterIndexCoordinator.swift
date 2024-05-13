//
//  RegisterIndexCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import Foundation
import UIKit

class RegisterIndexCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerIndexVC = RegisterIndexViewController()
        registerIndexVC.coordinator = self
        self.navigationController.pushViewController(registerIndexVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    func navigationToRegisterGender() {
        let registerGenderCoordinator = RegisterGenderCoordinator(navigationController: self.navigationController)
        registerGenderCoordinator.start()
    }
    
    
}
