//
//  MenuItem.swift
//  DoorDashExperiments
//
//  Created by Yi Wang on 2/17/22.
//


import Foundation

struct MenuItem {
    
    var name: String
    var description: String
    var price: Double
    var modifiers: [Modifier] = []
    
    mutating func add(modifer: Modifier) {
        modifiers.append(modifer)
    }
    
}
