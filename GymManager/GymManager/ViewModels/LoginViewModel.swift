//
//  LoginViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 28/05/24.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewModel {
    
    func validateTextField (email: String, password: String, button: UIButton) {
        
        if email.isEmpty || password.isEmpty {
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
    
    func validateUser(email: String, password: String, viewController: UIViewController, onSucess: @escaping () -> Void?) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.errorMessage(viewController: viewController)
            } else {
                onSucess()
            }
        }
        
    }
    
    private func errorMessage(viewController: UIViewController) {
        let alert = Alert(controller: viewController)
        alert.getAlert(titulo: "Falha ao fazer login", mensagem: "Email ou senha incorretos")
    }
    
}
