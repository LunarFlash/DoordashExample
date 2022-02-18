//
//  Menu.swift
//  DoorDashExperiments
//
//  Created by Yi Wang on 2/17/22.
//

import Foundation

struct Menu {
    
    var items: [MenuItem]
    
    mutating func add(item: MenuItem) {
        items.append(item)
    }
    
    mutating func add(items: [MenuItem]) {
        self.items.append(contentsOf: items)
    }
}
