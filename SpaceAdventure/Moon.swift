//
//  Moon.swift
//  SpaceAdventure
//
//  Created by Kenneth Debruyn on 12/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import Foundation

class Moon {
    
    
    // MARK: - Properties
    let name: String
    let description: String
    
    
    // MARK: - Initializer
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    
    // MARK: - Functions
    func hasName(_ name: String) -> Bool {
        if self.name == name {
            return true
        } else {
            return false
        }
    }
    
}
