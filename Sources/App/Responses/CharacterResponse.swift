//
//  File.swift
//  
//
//  Created by Chase Struse on 6/23/24.
//

import Vapor
import Fluent

struct CharacterResponse: Content {
    var message: String
    var characterCreated: Character
}
