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
    
    func getUserData(uid: String) async {
        let docRef = Firestore.firestore().collection("users").document(uid)

        do {
          let document = try await docRef.getDocument()
          if document.exists {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Document data: \(dataDescription)")
          } else {
            print("Document does not exist")
          }
        } catch {
          print("Error getting document: \(error)")
        }

    }
    
}
