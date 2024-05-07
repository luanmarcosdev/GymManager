//
//  AboutCoordinator.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import Foundation
import UIKit

class AboutCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AboutViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
        navigationController.isNavigationBarHidden = true
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    
}
