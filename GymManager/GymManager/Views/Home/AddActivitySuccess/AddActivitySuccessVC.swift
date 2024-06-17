//
//  AddActivitySuccessVC.swift
//  GymManager
//
//  Created by Luan Arruda on 17/06/24.
//

import UIKit

class AddActivitySuccessVC: UIViewController {
    
    var addActivitySuccessView: AddActivitySuccessView?
    var coordinator: AddActivitySuccessCoordinator?
    
    override func loadView() {
        self.addActivitySuccessView = AddActivitySuccessView()
        self.view = self.addActivitySuccessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addActivitySuccessView?.setDelegate(delegate: self)
    }

}

extension AddActivitySuccessVC: AddActivitySuccessViewDelegate {
    
    func actionSuccess() {
        self.coordinator?.back()
    }
    
}
