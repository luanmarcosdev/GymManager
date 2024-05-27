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
    var registerViewModel: RegisterViewModel?
    let userBuilder = UserBuilder.shared
    var alert: Alert?
    var auth: Auth?
    var firestore: Firestore?
    
    override func loadView() {
        self.registerIndexView = RegisterIndexView()
        self.view = self.registerIndexView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerViewModel = RegisterViewModel()
        self.registerIndexView?.setDelegate(delegate: self, tfDelegate: self)
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        self.alert = Alert(controller: self)
    }

}

extension RegisterIndexViewController: RegisterIndexViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    func actionRegister() {
        
        guard let name = registerIndexView?.nameTextField.text, let email = registerIndexView?.emailTextField.text, let password = registerIndexView?.passwordTextField.text else { return }
        
        
        let validate = self.registerViewModel?.validateEmailAndPassword(email: email, password: password, viewController: self) ?? false
        
        if validate {
            self.registerViewModel?.createNewUser(name: name, email: email, password: password, viewController: self)
        } 
//
//        if validate {
//            
//            self.auth?.createUser(withEmail: email, password: password) { result, error in
//                
//                if error != nil {
//                    
//                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao cadastrar, tente novamente.")
//                    
//                } else {
//                    
//                    if let idUser = result?.user.uid {
//                        self.firestore?.collection("users").document(idUser).setData([
//                            "name": name,
//                            "email": email,
//                            "idUser": idUser
//                        ])
//                    }
//                    
//                    self.userBuilder.setMainInfos(name: name, email: email, password: password)
//                    self.coordinator?.navigationToRegisterSucess()
//                    
//                }
//                
//            }
//            
//        } else {
//            self.alert?.getAlert(titulo: "Atenção", mensagem: "E-mail ou senha invalidos.")
//        }
        
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
