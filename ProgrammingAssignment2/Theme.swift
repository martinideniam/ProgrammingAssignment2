//
//  Theme.swift
//  ProgrammingAssignment2
//
//  Created by Vladislav Gorovenko on 08.04.2022.
//

import Foundation

struct Theme {
    var name: String
    var emojis: Array<String>
    var numberOfCards: Int
    var color: Theme.Colors
    
    enum Colors {
        case red, green, blue, orange, gray, pink
    }
    
    init(name: String, emojis: Array<String>, numberOfCards: Int, color: Theme.Colors) {
        self.name = name
        self.emojis = emojis
        self.numberOfCards = (numberOfCards > emojis.count) ? emojis.count-5 : numberOfCards 
        self.color = color
    }
}
