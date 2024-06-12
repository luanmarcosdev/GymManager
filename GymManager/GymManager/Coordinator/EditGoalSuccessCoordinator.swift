//
//  EditGoalSuccessCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 11/06/24.
//

import Foundation
import UIKit

class EditGoalSuccessCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let editGoalSuccessVC = EditGoalSuccessVC()
        editGoalSuccessVC.coordinator = self
        self.navigationController.pushViewController(editGoalSuccessVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func navigationToHomeScreen() {
        let homeVC = HomeCoordinator(navigationController: self.navigationController)
        homeVC.start()
    }
    
    
}
