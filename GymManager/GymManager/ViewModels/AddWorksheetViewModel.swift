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
    
}
