//
//  Alert.swift
//  GymManager
//
//  Created by Luan Arruda on 27/05/24.
//

import Foundation
import UIKit

class Alert {
    
    var controller: UIViewController
        
    init(controller: UIViewController){
        self.controller = controller
    }
        
    func getAlert(titulo: String, mensagem: String, completion: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .cancel) { action in
            completion?()
        }
        alertController.addAction(button)
        self.controller.present(alertController, animated: true, completion: nil)
    }
    
}
