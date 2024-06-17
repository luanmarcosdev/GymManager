//
//  AddWorksheetViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 17/06/24.
//

import Foundation
import UIKit
import FirebaseFirestore

class AddWorksheetViewModel {
    
    func addExercise(viewController: UIViewController, completion: @escaping (Exercise?) -> Void?) {
        
        let alert = UIAlertController(title: "Adicione um novo exercício", message: "Insira o nome e a carga", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Nome"
            textField.keyboardType = .default
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Carga"
            textField.keyboardType = .numberPad
        }
        
        let confirmAction = UIAlertAction(title: "Confirmar", style: .default) { _ in
            
            guard let name = alert.textFields?[0].text, let weight = Int((alert.textFields?[1].text)!) else {return}
            
            if name.isEmpty || weight < 0 {
                self.showValidationError(vc: viewController)
                completion(nil)
            } else {
                completion(Exercise(name: name, weight: weight))
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            completion(nil)
        }
        
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true)
        
    }
    
    private func showValidationError(vc: UIViewController) {
        
        let errorAlert = UIAlertController(title: "Dados inválidos.", message: "Erro ao adicionar exercicio.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        errorAlert.addAction(okAction)
        
        vc.present(errorAlert, animated: true, completion: nil)
    }
    
    func validateTextField (id: String, description: String, button: UIButton) {
        
        if id.isEmpty || description.isEmpty {
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
    
    func saveNewWorksheet(title: String, description: String, exercises: [Exercise], user: User) {
        
        let worksheets = self.createNewWorksheet(title: title, description: description, exercises: exercises, user: user)
        
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
            "worksheets": worksheets,
            "assessments": user.assessments
        ])
    }
    
    private func createNewWorksheet(title: String, description: String, exercises: [Exercise], user: User) -> [[String: Any]] {
        
        let newWorksheet = Worksheet(title: title, description: description, exercises: exercises)
        var mutableUser = user
        mutableUser.worksheets.append(newWorksheet)
        
        let worksheetsArray = mutableUser.worksheets.map { worksheet -> [String: Any] in
            return [
                "title": worksheet.title,
                "description": worksheet.description,
                "exercises": worksheet.exercises.map { exercise -> [String: Any] in
                    return [
                        "name": exercise.name,
                        "weight": exercise.weight
                    ]
                }
            ]
        }
        
        return worksheetsArray
    }
    
    
}
