//
//  AddWorksheetCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 05/06/24.
//

import Foundation
import UIKit

class AddWorksheetCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addWorksheetVC = AddWorksheetVC()
        addWorksheetVC.coordinator = self
        self.navigationController.pushViewController(addWorksheetVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start(user: User) {
        let addWorksheetVC = AddWorksheetVC()
        addWorksheetVC.coordinator = self
        addWorksheetVC.user = user
        self.navigationController.pushViewController(addWorksheetVC, animated: true)
        self.navigationController.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    
}
