//
//  AddWorksheetVC.swift
//  GymManager
//
//  Created by Luan Arruda on 05/06/24.
//

import UIKit

class AddWorksheetVC: UIViewController {
    
    var coordinator: AddWorksheetCoordinator?
    var addWorksheetView: AddWorksheetView?
    
    override func loadView() {
        self.addWorksheetView = AddWorksheetView()
        self.view = addWorksheetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addWorksheetView?.setDelegate(delegate: self)
    }
    
}

extension AddWorksheetVC: AddWorksheetViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionAddExercise() {
        print("tapped add exercise")
    }
    
    func actionSaveButton() {
        print("tapped save button")
    }
    
    
}
