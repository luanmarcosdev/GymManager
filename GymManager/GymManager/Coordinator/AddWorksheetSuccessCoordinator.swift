//
//  AddWorksheetSuccessCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 19/06/24.
//

import Foundation
import UIKit

class AddWorksheetSuccessCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addWorksheetSuccessVC = AddWorksheetSuccessVC()
        addWorksheetSuccessVC.coordinator = self
        self.navigationController.pushViewController(addWorksheetSuccessVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func navigationToHomeScreen() {
        let homeVC = HomeCoordinator(navigationController: self.navigationController)
        homeVC.start()
    }
    
}
