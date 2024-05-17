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
    
    let numbers = Array(12...70)
    
    override func loadView() {
        self.registerAgeView = RegisterAgeView()
        self.view = registerAgeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerAgeView?.setDelegate(delegate: self, pvDataSource: self, pvDelegate: self)
    }

}

extension RegisterAgeViewController: RegisterAgeViewDelegate {
    
    func actionNext() {
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
        return numbers.count
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
        var rowTitle = "\(numbers[row])"
        let pickerLabel = UILabel()
        pickerLabel.text = rowTitle
        pickerLabel.textAlignment = .center
        
        if row == pickerView.selectedRow(inComponent: component) {
            pickerLabel.font = UIFont(name: CustomFont.robotBlack, size: 58)
            pickerLabel.textColor = CustomColor.white
        }else {
            pickerLabel.font = UIFont(name: CustomFont.robotBlack, size: 34)
            pickerLabel.textColor = CustomColor.darkSecondary

        }

        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }

    
}
