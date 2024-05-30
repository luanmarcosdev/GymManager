//
//  User.swift
//  GymManager
//
//  Created by Luan Arruda on 14/05/24.
//

import Foundation

enum Gender: CustomStringConvertible, Codable {
    case man
    case woman
    
    var description: String {
        switch self {
        case .man:
            return "man"
        case .woman:
            return "woman"
        }
    }
}

struct User: Codable {
    
    var worksheets: [Worksheet] = []
    var assessments: [Assessment] = []
    
    var name: String
    var email: String
    var password: String
    var idUser: String
    var gender: Gender
    var age: Int
    var height: Int
    var weight: Int
    var goal: Int

}
