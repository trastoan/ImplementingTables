//
//  Weapon.swift
//  TableViewOverview
//
//  Created by Yuri on 26/04/20.
//  Copyright © 2020 academy. All rights reserved.
//

import Foundation

struct Weapon {
    var name: String
    var dice: Dice
    var bonus: Int
    var about: String
    var imageName: String
    
    
    //Mock methods
    
    static func createBow() -> Weapon {
        return Weapon(name: "Good Bow", dice: .ten, bonus: 4, about: "This is a bow", imageName: "bow")
    }
    
    static func createDagger() -> Weapon {
        return Weapon(name: "Good Dagger", dice: .ten, bonus: 6, about: "This is a dagger", imageName: "dagger")
    }
    
    static func createSpear() -> Weapon {
        return Weapon(name: "Good Spear", dice: .ten, bonus: 12, about: "This is a spear", imageName: "spear")
    }
    
    static func createMelee() -> [Weapon] {
        var weapons = [Weapon]()
        for _ in 0...10 { weapons.append(Weapon(name: "Good Spear", dice: .ten, bonus: 12, about: "This is a spear", imageName: "spear"))}
        
        return weapons
    }
    
    static func createRanged() -> [Weapon] {
        var weapons = [Weapon]()
        for _ in 0...10 { weapons.append(Weapon(name: "Good Bow", dice: .ten, bonus: 4, about: "This is a bow", imageName: "bow"))}
        
        return weapons
    }
}
