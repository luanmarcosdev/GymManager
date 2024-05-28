//
//  RegisterIndexViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class RegisterIndexViewController: UIViewController {
    
    var coordinator: RegisterIndexCoordinator?
    var registerIndexView: RegisterIndexView?
    var registerIndexViewModel: RegisterIndexViewModel?
    let userBuilder = UserBuilder.shared
    var alert: Alert?
    
    override func loadView() {
        self.registerIndexView = RegisterIndexView()
        self.view = self.registerIndexView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerIndexViewModel = RegisterIndexViewModel()
        self.registerIndexView?.setDelegate(delegate: self, tfDelegate: self)
        self.alert = Alert(controller: self)
    }

}

extension RegisterIndexViewController: RegisterIndexViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionRegister() {
        
        guard let name = registerIndexView?.nameTextField.text, let email = registerIndexView?.emailTextField.text, let password = registerIndexView?.passwordTextField.text else { return }
        
        
        let validate = self.registerIndexViewModel?.validateEmailAndPassword(email: email, password: password, viewController: self) ?? false
        
        if validate {
            self.registerIndexViewModel?.createNewUser(name: name, email: email, password: password, viewController: self, onSucess: {
                self.coordinator?.navigationToRegisterSucess()
            })
        }
        
    }
    
    
}

extension RegisterIndexViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let name = self.registerIndexView?.nameTextField.text,
              let email = self.registerIndexView?.emailTextField.text,
              let password = self.registerIndexView?.passwordTextField.text,
              let button = self.registerIndexView?.registerButton else {return}
        
        self.registerIndexViewModel?.validateTextField(name: name, email: email, password: password, button: button)
        
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
