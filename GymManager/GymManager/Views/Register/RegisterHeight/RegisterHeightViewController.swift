//
//  RegisterHeightViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 10/05/24.
//

import UIKit

class RegisterHeightViewController: UIViewController {
    
    var coordinator: RegisterHeightCoordinator?
    
    var registerHeightView: RegisterHeightView?
    
    let heightNumbers = Array(100...220)
    
    override func loadView() {
        self.registerHeightView = RegisterHeightView()
        self.view = self.registerHeightView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerHeightView?.setDelegate(delegate: self, pvDataSource: self, pvDelegate: self)
        self.registerHeightView?.heightPickerView.selectRow(60, inComponent: 0, animated: false)
    }

}

extension RegisterHeightViewController: RegisterHeightViewDelegate {
    
    func actionNext() {
        let selectedRow = self.registerHeightView?.heightPickerView.selectedRow(inComponent: 0)
        // to do chamar builder
        print(heightNumbers[selectedRow!])
        //fim todo
        self.coordinator?.navigationToRegisterWeightScreen()
    }
    
    func actionBack() {
        self.coordinator?.back()
    }
    
}

extension RegisterHeightViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heightNumbers.count
    }
    
}

extension RegisterHeightViewController : UIPickerViewDelegate {
        
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 78
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 114
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let rowTitle = "\(heightNumbers[row])"
        let pickerLabel = UILabel()
        pickerLabel.text = rowTitle
        pickerLabel.textAlignment = .center
        pickerLabel.backgroundColor = .clear
        
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
