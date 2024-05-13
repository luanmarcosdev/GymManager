//
//  HomeCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import Foundation
import UIKit

class HomeCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        self.navigationController.pushViewController(homeVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
}
