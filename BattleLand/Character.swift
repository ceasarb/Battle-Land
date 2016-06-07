//
//  Character.swift
//  BattleLand
//
//  Created by Ceasar Barbosa on 6/4/16.
//  Copyright © 2016 Ceasar Barbosa. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int
    private var _attackPower:Int
    private var _name: String
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    
    init(startingHP: Int, attackPower: Int, name: String) {
        self._hp = startingHP
        self._attackPower = attackPower
        self._name = name
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
    
    
    
}