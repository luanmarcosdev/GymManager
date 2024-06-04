//
//  Worksheet.swift
//  GymManager
//
//  Created by Luan Arruda on 15/05/24.
//

import Foundation

struct Worksheet: Codable {
    var title: String
    var description: String
    var exercise: [String: Int]
}
