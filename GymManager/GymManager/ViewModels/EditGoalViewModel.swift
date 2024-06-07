//
//  EditGoalViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 05/06/24.
//

import Foundation
import UIKit
import FirebaseFirestore

class EditGoalViewModel {
    
    func validateTextfield(goal: String, button: UIButton) -> Int? {
        
        guard let number = Int(goal) else {
            configButton(button: button, enable: false)
            return nil
        }

        configButton(button: button, enable: true)
        return number

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
    
    func validateGoal(goal: Int, viewController: UIViewController) -> Bool {
        
        if goal > 31 || goal < 1 {
            self.errorMessage(viewController: viewController)
            return false
        }
        
        return true
        
    }
    
    func saveNewGoal(user: User) {
            Firestore.firestore().collection("users").document(user.idUser).setData([
                "name": user.name,
                "email": user.email,
                "idUser": user.idUser,
                "gender": user.gender,
                "age": user.age,
                "height": user.height,
                "weight": user.weight,
                "goal": user.goal,
                "completedGoal": user.completedGoal,
                "worksheets": user.worksheets,
                "assessments": user.assessments
            ])
    }
    
    private func errorMessage(viewController: UIViewController) {
        let alert = Alert(controller: viewController)
        alert.getAlert(titulo: "Erro ao definir nova meta", mensagem: "Insira um número entre 1 e 31")
    }
    
}
