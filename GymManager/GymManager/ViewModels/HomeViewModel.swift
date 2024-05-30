//
//  HomeViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 24/05/24.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewModel {
 
    func getUserOn() -> String? {
        var idUser: String?
        if let currentUser = Auth.auth().currentUser {
            idUser = currentUser.uid
        }
        return idUser
    }
    
    func getUserData(uid: String, onSucess: @escaping (User) -> Void?) async {
        
        let docRef = Firestore.firestore().collection("users").document(uid)

        do {
            
            let document = try await docRef.getDocument()
            
            if document.exists {
                
                if let dataDescription = document.data() {
                    if let user = self.decodeUserData(data: dataDescription) {
                        onSucess(user)
                    }
                }
                
            }else {
                print("Não foi encontrado dados salvos para o usuário")
          }
            
        }catch {
            print("Erro ao obter o documento")
        }
        
    }
    
    private func decodeUserData(data: [String: Any] ) -> User? {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            let jsonDecoder = JSONDecoder()
            let user = try jsonDecoder.decode(User.self, from: jsonData)
            return user
        } catch {
            print("Erro ao decodificar dados do usuário.")
            return nil
        }
        

    }
    
}
