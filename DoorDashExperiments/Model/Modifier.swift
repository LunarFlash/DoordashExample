//
//  Modifier.swift
//  DoorDashExperiments
//
//  Created by Yi Wang on 2/17/22.
//

import Foundation

struct Modifier {
    
    var name: String
    var options: [ModifierOption] = []
}


struct ModifierOption {
    var name: String
    var price: Double
}
