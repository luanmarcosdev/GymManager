//
//  LoginViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var coordinator: LoginCoordinator?
    var loginView: LoginView?
    var loginViewModel: LoginViewModel?
    
    override func loadView() {
        self.loginView = LoginView()
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView?.setDelegate(delegate: self, TFDelegate: self)
        self.loginViewModel = LoginViewModel()
    }

}

extension LoginViewController: LoginViewDelegate {
   
    func registerButton() {
        self.coordinator?.navigationToRegisterScreen()
    }
    
    func forgotButton() {
        self.coordinator?.navigationToForgotScreen()
    }
    
    func loginButton() {
        
        guard let email = self.loginView?.emailTextField.text,
              let password = self.loginView?.passwordTextField.text else {return}
                
        self.loginViewModel?.validateUser(email: email, password: password, viewController: self, onSucess: {
            self.coordinator?.navigationToHomeScreen()
        })
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let email = self.loginView?.emailTextField.text,
              let password = self.loginView?.passwordTextField.text,
              let button = self.loginView?.loginButton else {return}
        
        self.loginViewModel?.validateTextField(email: email, password: password, button: button)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginView?.emailTextField {
            loginView?.passwordTextField.becomeFirstResponder()
            return true
        } else {
            loginView?.passwordTextField.resignFirstResponder()
            return true
        }
        
    }
    
}
