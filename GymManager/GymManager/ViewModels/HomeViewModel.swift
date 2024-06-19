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
    
    func updateCompletedGoalData(for user: User) {
        Firestore.firestore().collection("users").document(user.idUser).updateData(["completedGoal": user.completedGoal])
    }
    
    func updateUserScreen(for user: User, goalDescription: UILabel, completedGoal: UILabel) {
        
        self.setCompletedGoal(user, completedGoal)
        self.setGoalDescription(user, goalDescription)
        
    }
    
    private func setCompletedGoal(_ user: User, _ completedGoal: UILabel) {
        completedGoal.text = "\(user.completedGoal)"
    }
    
    private func setGoalDescription(_ user: User, _ goalDescription: UILabel) {
        let completedGoals = user.completedGoal
        let goal = user.goal
        let percentageCompleted = (completedGoals * 100) / goal
        var text: String
        if user.completedGoal < user.goal {
            text = "Você bateu \(percentageCompleted)% da sua meta (\(goal)). Faltam \(goal - completedGoals) treinos para completá-la."
        } else {
            text = "Você bateu \(percentageCompleted)% da sua meta (\(goal)). Uau, você foi incrivel! Parabêns 🔥"
        }
        goalDescription.text = text
    }
    
    func registerActivity(user: inout User, completedGoal: UILabel, goalDescription: UILabel, activityButton: UIButton ,onSucess: @escaping (User) -> Void? ) {
        
        user.completedGoal += 1
        
        activityButton.isEnabled = false
        activityButton.backgroundColor = CustomColor.gray
        
        self.setCompletedGoal(user, completedGoal)
        self.setGoalDescription(user, goalDescription)
        self.updateCompletedGoalData(for: user)
        
        onSucess(user)
    }
    
    func getRandomCardImage() -> String {
        
        let images = ["Card1", "Card2", "Card3", "Card4", "Card5"]
        let randomNumber = Int.random(in: 0...4)
        
        return images[randomNumber]
   
    }
    
}
