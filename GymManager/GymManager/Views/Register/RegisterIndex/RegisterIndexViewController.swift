//
//  RegisterIndexViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import UIKit

class RegisterIndexViewController: UIViewController {
    
    var coordinator: RegisterIndexCoordinator?
    
    var registerIndexView: RegisterIndexView?
    
    var registerViewModel: RegisterViewModel?
    
    override func loadView() {
        self.registerIndexView = RegisterIndexView()
        self.view = self.registerIndexView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerViewModel = RegisterViewModel()
        self.registerIndexView?.setDelegate(delegate: self, tfDelegate: self)
    }

}

extension RegisterIndexViewController: RegisterIndexViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionRegister() {
        self.coordinator?.navigationToRegisterGender()
    }
    
    
}

extension RegisterIndexViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let name = registerIndexView?.nameTextField.text,
              let email = registerIndexView?.emailTextField.text,
              let password = registerIndexView?.passwordTextField.text else {return}
        
        self.registerViewModel?.validateTextField(name: name, email: email, password: password, button: self.registerIndexView!.registerButton)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == registerIndexView?.nameTextField {
            registerIndexView?.emailTextField.becomeFirstResponder()
            return true
        } else if textField == registerIndexView?.emailTextField {
            registerIndexView?.passwordTextField.becomeFirstResponder()
            return true
        } else {
            registerIndexView?.passwordTextField.resignFirstResponder()
            return true
        }
        
    }
    
}
