//
//  User.swift
//  GymManager
//
//  Created by Luan Arruda on 14/05/24.
//

import Foundation

enum Gender {
    case man
    case woman
}

struct User {
    var name: String
    var email: String
    var senha: String
    var gender: Gender
    var age: Int
    var height: Double
    var weight: Double
    var goal: Int
}
