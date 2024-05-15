//
//  ForgotViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 08/05/24.
//

import UIKit

class ForgotViewController: UIViewController {
    
    var coordinator: ForgotCoordinator?
    
    var forgotView: ForgotView?
    
    override func loadView() {
        self.forgotView = ForgotView()
        self.view = forgotView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.forgotView?.setDelegate(delegate: self)
    }
    
}

extension ForgotViewController: ForgotViewDelegate {
    
    func actionBack() {
        coordinator?.back()
    }
    
    func actionRecovery() {
        // to do recovery
        print("recuperando")
    }
    
    
}
