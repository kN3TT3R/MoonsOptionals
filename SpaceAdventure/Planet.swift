//
//  Planet.swift
//  SpaceAdventure
//
//  Created by Kenneth Debruyn on 8/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import Foundation

class Planet {
    
    
    // MARK: - Properties
    let name: String
    let description: String
    var moons: [Moon]?
    
    
    // MARK: - Initializer
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    
    // MARK: - Functions
    func addMoon(moon: Moon) {
        if self.moons == nil { self.moons = [] }
        self.moons!.append(moon)
    }
    
        /*
                BEFORE OPTIONALS
     
        func hasMoons() -> Bool {
            return !moons!.isEmpty
        }
         */
 
    func hasName(_ name: String) -> Bool {
        if self.name == name {
            return true
        } else {
            return false
        }
    }
    
    func printPlanetWithMoons() {
        if self.moons != nil {
            printMoons()
        } else {
            print("\(self.name) has no moons.")
        }
    }
    
    func printMoons() {
        let moonNames = self.createStringOfMoonNames()
        let amountMoons = self.amountMoons()
        
        if amountMoons == 1 {
            print("\(self.name) has \(amountMoons) moon called: \(moonNames)")
        }
        else {
            print("\(self.name) has \(amountMoons) moons called: \(moonNames)")
        }
    }
    
    func amountMoons() -> Int {
        return moons!.count
    }
    
    func createStringOfMoonNames() -> String {
        let moonNames = moons!.map({"\($0.name)"}).joined(separator: ", ")
        return moonNames
    }
}









