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
    var addWorksheetViewModel: AddWorksheetViewModel?
    var exercises: [Exercise]?
    
    override func loadView() {
        self.addWorksheetView = AddWorksheetView()
        self.view = addWorksheetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addWorksheetView?.setDelegate(delegate: self)
        self.addWorksheetViewModel = AddWorksheetViewModel()
        self.exercises = []
    }
    
}

extension AddWorksheetVC: AddWorksheetViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionAddExercise() {
         
        self.addWorksheetViewModel?.addExercise(viewController: self, completion: { exercise in
            if let exercise = exercise {
                self.exercises?.append(exercise)
            }
        })
        
    }
    
    func actionSaveButton() {
        print("tapped save button")
    }
    
    
}
