//
//  RegisterGoalViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 27/05/24.
//

import Foundation
import UIKit
import FirebaseFirestore

class RegisterGoalViewModel {
    
    let userBuilder = UserBuilder.shared
    var user: User?
    
    func createNewUser() {
        self.buildNewUser()
        print(user!)
        
        if let user = self.user {
            Firestore.firestore().collection("users").document(user.idUser).setData([
                "name": user.name,
                "email": user.email,
                "idUser": user.idUser,
                "gender": user.gender,
                "age": user.age,
                "height": user.height,
                "weight": user.weight,
                "goal": user.goal,
                "worksheets": [],
                "assessments": []
            ])
        }
        
        self.clearUserBuilder()
    }
    
    private func buildNewUser() {
        let newUser = self.userBuilder.build()
        self.user = newUser
    }
    
    private func clearUserBuilder () {
        self.userBuilder.reset()
    }
    
    
}
