//
//  ForgotCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 08/05/24.
//

import Foundation
import UIKit

class ForgotCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ForgotViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    
}
