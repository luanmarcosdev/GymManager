//
//  RegisterAgeViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import UIKit

class RegisterAgeViewController: UIViewController {
    
    var coordinator: RegisterAgeCoordinator?
    var registerAgeView: RegisterAgeView?
    let userBuilder = UserBuilder.shared
    let ageNumbers = Array(12...70)
    
    override func loadView() {
        self.registerAgeView = RegisterAgeView()
        self.view = registerAgeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerAgeView?.setDelegate(delegate: self, pvDataSource: self, pvDelegate: self)
        self.registerAgeView?.agePickerView.selectRow(8, inComponent: 0, animated: false)
    }

}

extension RegisterAgeViewController: RegisterAgeViewDelegate {
    
    func actionNext() {   
        let selectedRow = self.registerAgeView?.agePickerView.selectedRow(inComponent: 0)
        self.userBuilder.setAge(age: self.ageNumbers[selectedRow!])
        self.coordinator?.navigationToRegisterHeightScreen()
    }
    
    func actionBack() {
        self.coordinator?.back()
    }
    
}

extension RegisterAgeViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageNumbers.count
    }
    
}

extension RegisterAgeViewController : UIPickerViewDelegate {
        
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 78
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 114
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let rowTitle = "\(ageNumbers[row])"
        let pickerLabel = UILabel()
        pickerLabel.text = rowTitle
        pickerLabel.textAlignment = .center
        pickerLabel.backgroundColor = .clear
        pickerLabel.font = UIFont(name: CustomFont.robotBlack, size: 48)
        
        if row == pickerView.selectedRow(inComponent: component) {
            pickerLabel.font = UIFont(name: CustomFont.robotBlack, size: 58)
            pickerLabel.textColor = CustomColor.white
        } else {
            pickerLabel.textColor = CustomColor.darkSecondary
        }

        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }

    
}
