//
//  AddWorksheetSuccessVCViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 19/06/24.
//

import UIKit

class AddWorksheetSuccessVC: UIViewController {
    
    var addWorksheetSuccessView: AddWorksheetSuccessView?
    var coordinator: AddWorksheetSuccessCoordinator?
    
    override func loadView() {
        self.addWorksheetSuccessView = AddWorksheetSuccessView()
        self.view = self.addWorksheetSuccessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addWorksheetSuccessView?.setDelegate(delegate: self)

    }

}

extension AddWorksheetSuccessVC: AddWorksheetSuccessViewDelegate {
    
    func actionSuccess() {
        self.coordinator?.navigationToHomeScreen()
    }
    
}
