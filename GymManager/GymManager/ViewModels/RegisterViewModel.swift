//
//  RegisterViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 15/05/24.
//

import Foundation
import UIKit

class RegisterViewModel {
    
    func validateTextField (name: String, email: String, password: String, button: UIButton) {
        
        if name.isEmpty || email.isEmpty || password.isEmpty {
            self.configButton(button: button, enable: false)
        } else {
            self.configButton(button: button, enable: true)
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
    
    func selectedGenderButton(manButton: UIButton, womanButton: UIButton ,gender: Gender, enableButton: UIButton) -> Gender {
        
        self.configButton(button: enableButton, enable: true)
        
        if gender == .man {
            manButton.setImage(UIImage(named: "ManSelected"), for: .normal)
            womanButton.setImage(UIImage(named: "Woman"), for: .normal)
            return .man
        } else {
            womanButton.setImage(UIImage(named: "WomanSelected"), for: .normal)
            manButton.setImage(UIImage(named: "Man"), for: .normal)
            return .woman
        }
        
    }
    
    func insertUserNameInLabel(label: UILabel, userName: String) {
        label.text = "Olá, \(userName)"
    }
    

    
    // RegisterGender - to do func validar se selecionou algum gender button / func enviar botao clicado para o Builder (setGender)
    
    // RegisterAge - to do func validar se age é valida / func enviar age selecionada para o Builder (setAge)
    
    // RegisterHeight -  to do func validar se height é valida / func enviar height selecionada para o Builder (setHeight)
    
    // RegisterWeight -  to do func validar se weight é valida / func enviar weight selecionada para o Builder (setWeight)
    
    // RegisterGoal -  to do func validar se goal é valida / func enviar goal selecionada para o Builder (setGoal)
    
    // TO DO criar um user passando as informaçoes coletadas para o UserBuilder e chamando o metodo build() e dps reset() após isso usar chamar outra classe a ser definida para salvar o usuário na API do firebase
    
    
}
