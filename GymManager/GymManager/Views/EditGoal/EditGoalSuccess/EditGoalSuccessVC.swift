//
//  EditGoalViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 10/06/24.
//

import UIKit

class EditGoalSucessVC: UIViewController {
    
    var editGoalSuccessView: EditGoalSuccessView?
    
    override func loadView() {
        self.editGoalSuccessView = EditGoalSuccessView()
        self.view = self.editGoalSuccessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
