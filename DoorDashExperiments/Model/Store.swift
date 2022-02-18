//
//  Store.swift
//  DoorDashExperiments
//
//  Created by Yi Wang on 2/17/22.
//

import Foundation

struct Store {
    var name: String
    var menus: [Menu]
    
    
    mutating func addMenu(menu: Menu) {
        menus.append(menu)
    }
    
}
