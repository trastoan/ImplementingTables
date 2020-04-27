//
//  Character.swift
//  TableViewOverview
//
//  Created by Yuri on 26/04/20.
//  Copyright © 2020 academy. All rights reserved.
//

import Foundation

class Character {
    var imageName: String
    var name: String
    var charClass: String
    var charLevel: Int
    
    var rangedWeapon: [Weapon]
    var meleeWeapon: [Weapon]
    var itens: [Item]
    
    init(imageName: String, name: String, charClass: String, charLevel: Int, rangedWeapon: [Weapon], meleeWeapon: [Weapon], itens: [Item]) {
        self.imageName = imageName
        self.name = name
        self.charClass = charClass
        self.charLevel = charLevel
        self.rangedWeapon = rangedWeapon
        self.meleeWeapon = meleeWeapon
        self.itens = itens
    }
    
    //Mock character
    static func makeAnna() -> Character {
        let ranged = Weapon.createRanged()
        let melee = Weapon.createMelee()
        return Character(imageName: "anna", name: "Anna Fritjorf", charClass: "Fighter", charLevel: 5, rangedWeapon: ranged, meleeWeapon: melee, itens: [])
    }
}
