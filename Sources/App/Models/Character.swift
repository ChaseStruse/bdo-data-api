//
//  File.swift
//  
//
//  Created by Chase Struse on 6/25/24.
//

import Foundation
import Vapor

struct Character: Content {
    var familyName: String
    var familyFame: Int
    var mainClass: String
    var gearScore: Int
    
    init(familyName: String, familyFame: Int, mainClass: String, gearScore: Int) {
        self.familyName = familyName
        self.familyFame = familyFame
        self.mainClass = mainClass
        self.gearScore = gearScore
    }
}
