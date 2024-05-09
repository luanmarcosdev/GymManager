//
//  RegisterGenderCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import Foundation
import UIKit

class RegisterGenderCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registerGenderVC = RegisterGenderViewController()
        registerGenderVC.coordinator = self
        self.navigationController.pushViewController(registerGenderVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    
}
