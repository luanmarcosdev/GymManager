//
//  CoordinatorProtocol.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    
    var navigationController: UINavigationController {get}
    
    init(navigationController: UINavigationController)
    
    func start()
}
