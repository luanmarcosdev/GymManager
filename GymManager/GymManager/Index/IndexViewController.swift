//
//  IndexViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import UIKit

class IndexViewController: UIViewController {
    
    var coordinator: IndexCoordinator?
    
    var indexView: IndexView?
    
    override func loadView() {
        self.indexView = IndexView()
        self.view = self.indexView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        indexView?.setDelegate(delegate: self)
    }

}

extension IndexViewController: IndexViewDelegate {
    
    func actionLogin() {
        self.coordinator?.navigationToLoginScreen()
    }
    
    func actionRegister() {
        self.coordinator?.navigationToRegisterScreen()
    }
    
    func actionAbout() {
        self.coordinator?.navigationToAboutScreen()
    }
    
}
