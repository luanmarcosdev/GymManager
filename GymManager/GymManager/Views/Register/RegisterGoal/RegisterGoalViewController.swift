//
//  RegisterGoalViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterGoalViewController: UIViewController {
    
    var coordinator: RegisterGoalCoordinator?
    
    var registerGoalView: RegisterGoalView?
    
    var registerViewModel: RegisterViewModel?
    
    let userBuilder = UserBuilder.shared
    
    var goalNumbers = Array(1...31)
    
    override func loadView() {
        self.registerGoalView = RegisterGoalView()
        self.view = self.registerGoalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerGoalView?.setDelegate(delegate: self, pvDataSource: self, pvDelegate: self)
        self.registerGoalView?.goalPickerView.selectRow(11, inComponent: 0, animated: false)
    }

}

extension RegisterGoalViewController: RegisterGoalViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionFinish() {
        let selectedRow = self.registerGoalView?.goalPickerView.selectedRow(inComponent: 0)
        self.userBuilder.setGoal(goal: self.goalNumbers[selectedRow!])
        self.registerViewModel?.createNewUser()
        self.coordinator?.navigationToHomeScreen()
    }
    
}

extension RegisterGoalViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return goalNumbers.count
    }
    
}

extension RegisterGoalViewController : UIPickerViewDelegate {
        
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 78
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 114
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let rowTitle = "\(goalNumbers[row])"
        
        let pickerLabel = UILabel()
        
        pickerLabel.text = rowTitle
        pickerLabel.textAlignment = .center
        pickerLabel.backgroundColor = .clear
        
        if row == pickerView.selectedRow(inComponent: component) {
            pickerLabel.font = UIFont(name: CustomFont.robotBlack, size: 58)
            pickerLabel.textColor = CustomColor.white
        } else {
            pickerLabel.font = UIFont(name: CustomFont.robotBlack, size: 34)
            pickerLabel.textColor = CustomColor.darkSecondary
        }
        
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }

    
}
