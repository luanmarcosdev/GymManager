//
//  EditGoalCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 05/06/24.
//

import Foundation
import UIKit

class EditGoalCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let editGoalVC = EditGoalViewController()
        editGoalVC.coordinator = self
        self.navigationController.pushViewController(editGoalVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start(user: User) {
        let editGoalVC = EditGoalViewController()
        editGoalVC.coordinator = self
        editGoalVC.user = user
        self.navigationController.pushViewController(editGoalVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    
}
