//
//  RegisterGenderViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 27/05/24.
//

import Foundation
import UIKit

class RegisterGenderViewModel {
    
    let userBuilder = UserBuilder.shared
    
    func selectedGenderButton(manButton: UIButton, womanButton: UIButton ,gender: Gender, enableButton: UIButton) -> String {
        
        self.configButton(button: enableButton, enable: true)
        
        if gender == .man {
            manButton.setImage(UIImage(named: "ManSelected"), for: .normal)
            womanButton.setImage(UIImage(named: "Woman"), for: .normal)
            return "man"
        } else {
            womanButton.setImage(UIImage(named: "WomanSelected"), for: .normal)
            manButton.setImage(UIImage(named: "Man"), for: .normal)
            return "woman"
        }
        
    }
    
    private func configButton(button: UIButton, enable: Bool) {
        
        if enable {
            button.backgroundColor = CustomColor.green
            button.isEnabled = enable
        } else {
            button.backgroundColor = CustomColor.gray
            button.isEnabled = enable
        }
        
    }
    
    func insertUserNameInLabel(label: UILabel) {
        label.text = "Olá, \(self.userBuilder.getName())"
    }
    
    func buildGender(gender: String, OnSucess: @escaping () -> Void?) {
        self.userBuilder.setGender(gender: gender)
        OnSucess()
    }
    
}
