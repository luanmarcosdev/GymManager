//
//  HomeViewModel.swift
//  GymManager
//
//  Created by Luan Arruda on 24/05/24.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeViewModel {
 
    private var user: User?
    
    func getUserOn(userDB: @escaping () -> Void? ) {
        userDB()
    }
    
    private func setUserOn(user: User) {
        self.user = user
    }
    
    func showInfosUserOn() {
        
    }
    
}
