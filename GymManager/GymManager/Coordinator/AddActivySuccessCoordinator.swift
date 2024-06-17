//
//  AddAcitivySuccessCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 17/06/24.
//

import Foundation
import UIKit

class AddActivitySuccessCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addAcitivtySuccessVC = AddActivitySuccessVC()
        addAcitivtySuccessVC.coordinator = self
        self.navigationController.pushViewController(addAcitivtySuccessVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
}
