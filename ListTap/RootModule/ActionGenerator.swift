//
//  RandomGenerator.swift
//  collectionView
//
//  Created by Павел Курзо on 16.05.22.
//

import Foundation

enum Action: String {
    case increment
    case reset
    case delete
    case addModule
    case addElement    
}

class ActionGenerator {

   static func getRandomAction() -> Action {
        let actions: [Action] = [.increment, .increment, .increment, .increment, .increment, .reset, .reset, .reset, .delete, .addModule]
        return actions.randomElement() ?? .increment
    }
}
