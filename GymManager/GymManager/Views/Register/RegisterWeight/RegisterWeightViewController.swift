//
//  RegisterWeightViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterWeightViewController: UIViewController {
    
    var coordinator: RegisterWeightCoordinator?
    
    var registerWeightView: RegisterWeightView?
    
    let weightNumbers = Array(40...220)
    
    override func loadView() {
        self.registerWeightView = RegisterWeightView()
        self.view = self.registerWeightView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerWeightView?.setDelegate(delegate: self, pvDataSource: self, pvDelegate: self)
        self.registerWeightView?.weightPickerView.selectRow(20, inComponent: 0, animated: false)
    }
    
}

extension RegisterWeightViewController: RegisterWeightViewDelegate {
    
    func actionNext() {
        let selectedRow = self.registerWeightView?.weightPickerView.selectedRow(inComponent: 0)
        // to do chamar builder
        print(weightNumbers[selectedRow!])
        //fim todo
        self.coordinator?.navigationToRegisterGoalScreen()
    }
    
    func actionBack() {
        self.coordinator?.back()
    }
    
}

extension RegisterWeightViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weightNumbers.count
    }
    
}

extension RegisterWeightViewController : UIPickerViewDelegate {
        
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 78
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 114
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let rowTitle = "\(weightNumbers[row])"
        let pickerLabel = UILabel()
        pickerLabel.text = rowTitle
        pickerLabel.textAlignment = .center
        pickerLabel.backgroundColor = .clear
        pickerLabel.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        
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
