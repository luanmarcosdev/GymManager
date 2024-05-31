//
//  UserBuilder.swift
//  GymManager
//
//  Created by Luan Arruda on 15/05/24.
//

import Foundation

class UserBuilder {
    
    static let shared = UserBuilder()
    
    private init () {}
    
    private var name: String?
    private var email: String?
    //private var password: String?
    private var idUser: String?
    private var gender: Gender?
    private var age: Int?
    private var height: Int?
    private var weight: Int?
    private var goal: Int?
    
    func setMainInfos(name: String, email: String, idUser: String) {
        self.name = name
        self.email = email
        //self.password = password
        self.idUser = idUser
    }
    
    func setGender(gender: Gender) {
        self.gender = gender
    }
    
    func setAge(age: Int) {
        self.age = age
    }
    
    func setHeight(height: Int) {
        self.height = height
    }
    
    func setWeight(weight: Int) {
        self.weight = weight
    }
    
    func setGoal(goal: Int) {
        self.goal = goal
    }
    
    func getName() -> String {
        return name ?? ""
    }
    
    func reset() {
        self.name = nil
        self.email = nil
        //self.password = nil
        self.gender = nil
        self.age = nil
        self.height = nil
        self.weight = nil
        self.goal = nil
    }
    
    func build() -> User? {
        
        guard let name = self.name,
                let email = self.email,
                //let password = self.password,
                let gender = self.gender,
                let idUser = self.idUser,
                let age = self.age,
                let height = self.height,
                let weight = self.weight,
                let goal = self.goal
        else {
            return nil
        }
        
        return User(name: name, email: email, idUser: idUser, gender: gender, age: age, height: height, weight: weight, goal: goal)
        
    }
    
}
