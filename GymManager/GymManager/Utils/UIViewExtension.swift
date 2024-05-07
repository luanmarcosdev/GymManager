//
//  UIViewExtension.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import Foundation
import UIKit

extension UIView {
    
    func randomImage(imageName: String, maxNumber: Int) -> String {
        let imageName = imageName
        let randomNumber = String(Int.random(in: 1...maxNumber))
        return "\(imageName)\(randomNumber)"
    }
    
}
