//
//  User.swift
//  GymManager
//
//  Created by Luan Arruda on 14/05/24.
//

import Foundation

enum Gender: String, Codable {
    case man = "man"
    case woman = "woman"
}

struct User: Codable {
    
    var worksheets: [Worksheet] = []
    var assessments: [Assessment] = []
    
    var name: String
    var email: String
    var idUser: String
    var gender: Gender
    var age: Int
    var height: Int
    var weight: Int
    var goal: Int

}
