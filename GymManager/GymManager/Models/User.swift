//
//  User.swift
//  GymManager
//
//  Created by Luan Arruda on 14/05/24.
//

import Foundation

struct User: Codable {
    
    var worksheets: [Worksheet] = []
    var assessments: [Assessment] = []
    
    var name: String
    var email: String
    var idUser: String
    var gender: String
    var age: Int
    var height: Int
    var weight: Int
    var goal: Int
    var completedGoal: Int

}
