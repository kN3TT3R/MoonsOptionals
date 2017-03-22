//
//  SpaceAdventure.swift
//  SpaceAdventure
//
//  Created by Kenneth Debruyn on 6/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import Foundation

class SpaceAdventure {

    
    // MARK: - Properties
    let planetarySystem: PlanetarySystem
    
    
    // MARK: - Initializer
    init(planetarySystem: PlanetarySystem) {
        self.planetarySystem = planetarySystem
    }
    
    
    // MARK: - Internal Functions
    func start() {
        displayIntroduction()
        greetAdventurer()
        determineDestination()
    }
    

    // MARK: - Private Functions
    private func responseTo(message: String) -> String {
        print(message)
        return getln()
    }
    
    private func displayIntroduction() {
        
        print("Welcome to our \(planetarySystem.name)!\n")
        
        let numberPlanets = planetarySystem.planets.count
        
        if numberPlanets == 0 {
            print("In \(planetarySystem.name) there are no planets to explore.")
        }
        else {
            let planetNames = planetarySystem.createStringOfPlanetNames(planets: planetarySystem.planets)

            if numberPlanets == 1 {
                print("In \(planetarySystem.name) there is \(planetarySystem.planets.count) planet to explore: \(planetNames)")
            } else {
                print("In \(planetarySystem.name) there are \(planetarySystem.planets.count) planets to explore: \(planetNames)")
            }
            
            print("These are the moons:")
            for planet in planetarySystem.planets {
                planet.printPlanetWithMoons()
            }
            
                /*
                        BEFORE OPTIONALS
 
                if planetarySystem.planets.reduce(false, {$1.hasMoons() || $0 == true}) {
                    print("These are the moons:")
                }
                
                for planet in planetarySystem.planets {
                    if planet.hasMoons() {
                        planet.printMoons()
                    } else {
                        print("\(planet.name) has no moons.")
                    }
                }
                */
        }
    }
    
    private func greetAdventurer() {
        let name = responseTo(message: "\nWhat's your name?")
        print("Nice to meet you, \(name).")
        print("Let's go on an adventure!")
    }
    
    private func determineDestination() {
        
        var decision = ""
        
        while !(decision == "Y" || decision == "N") {
            
            decision = responseTo(message: "\nShall I randomly choose a planet for you to visit? (Y or N)").capitalized(with: .current)
            
            if decision == "Y" {
                if planetarySystem.hasPlanets() {
                    let destination = planetarySystem.generateRandomPlanet().name
                    visit(destination)
                }
                else {
                    print(planetarySystem.amountPlanets())
                    print("Sorry, \(planetarySystem.name) has no planets.")
                }
            }
            else
                
            if decision == "N" {
                if planetarySystem.hasPlanets() {
                    var destination = responseTo(message: "Name the planet you would like to visit.")
                    while !planetarySystem.hasPlanet(named: destination) {
                        destination = responseTo(message: "Name the planet you would like to visit.")
                    }
                    visit(destination)
                }
                else {
                    print("Sorry, \(planetarySystem.name) has no planets.")
                }
            }
            else {
                print("Sorry, I didn't get that.")
            }
            
        }
        
    }
    
    private func visit(_ destination: String) {
        print("\nArrived at \(destination)")
        
        for planet in planetarySystem.planets {
            if destination == planet.name {
                print("Travelling to \(destination). \(planet.description)")
                    planet.printPlanetWithMoons()
                
                    /*
                            BEFORE OPTIONALS
     
                    if planet.hasMoons() {
                        planet.printMoons()
                    } else {
                        print("Sorry, \(planet.name) has no moons.")
                    }
                    */
            }
        }
    }

}














