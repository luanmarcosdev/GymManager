//
//  RegisterViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 15/05/24.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth

class RegisterIndexViewModel {
    
    var alert: Alert?
    let userBuilder = UserBuilder.shared
    
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
    
    func validateEmailAndPassword(email: String, password: String, viewController: UIViewController) -> Bool {
        
        self.alert = Alert(controller: viewController)
        
        if !email.contains("@") || !email.contains(".com"){
            self.alert?.getAlert(titulo: "Atenção", mensagem: "E-mail inválido.")
            return false
        }
        
        if password.count < 8 {
            self.alert?.getAlert(titulo: "Atenção", mensagem: "Insira uma senha válida. Mínimo de 8 caracteres.")
            return false
        }
        
        return true
            
    }
    
    func createNewUser(name: String, email: String, password: String, viewController: UIViewController, onSucess: @escaping () -> Void?) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if error != nil {
                
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao cadastrar, tente novamente.")
                
                
            } else {
                
                if let idUser = result?.user.uid {
                    Firestore.firestore().collection("users").document(idUser).setData([
                        "name": name,
                        "email": email,
                        "idUser": idUser
                    ])
                }
                
                self.userBuilder.setMainInfos(name: name, email: email, password: password)
                onSucess()
            }
        }
    }
    
    func createNewUser() {
        let newUser = self.userBuilder.build()
        print(newUser!)
        // to do enviar para firebase newUser
        self.clearUserBuilder()
    }
    
    private func clearUserBuilder () {
        self.userBuilder.reset()
    }
    
    // TO DO criar um user passando as informaçoes coletadas para o UserBuilder e chamando o metodo build() e dps reset() após isso chamar outra classe a ser definida para salvar o usuário na API do firebase
    
    
}
