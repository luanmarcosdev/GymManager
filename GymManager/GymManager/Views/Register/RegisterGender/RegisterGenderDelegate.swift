//
//  RegisterGenderDelegate.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import Foundation

protocol RegisterGenderDelegate: AnyObject {
    func actionNext()
    func actionMan()
    func actionWoman()
    func actionBack()
}
