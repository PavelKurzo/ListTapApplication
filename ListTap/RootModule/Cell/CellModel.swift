//
//  CellModel.swift
//  collectionView
//
//  Created by Павел Курзо on 17.05.22.
//

import UIKit

enum Color: CaseIterable {
    case red
    case blue
    
    var color: UIColor{
        switch self {
            case .red: return UIColor.systemRed
            case .blue: return UIColor.systemCyan
        }
    }
    
    var multiplier: Int {
        switch self {
            case .red: return 3
            case .blue: return 1
        }
    }
    
    static var random: Color {
        Color.allCases.randomElement() ?? .red
    }
}

struct CellModel {
   private var initialValue: Int
   private let color: Color
   private var tapsCounter: Int
    
    init(initialValue: Int, color: Color) {
        self.initialValue = initialValue
        self.color = color
        self.tapsCounter = 0
    }
    
   mutating func didTap() {
        tapsCounter += 1
    }
    
    mutating func increment() {
        initialValue += 1
    }
    
    mutating func reset() {
        initialValue = 0
        tapsCounter = 0
    }
    
    mutating func add(_ value: Int) {
        initialValue += value
    }
    
    var displayedColor: UIColor {
        color.color
    }
    
    var displayedValue: String {
        let result = initialValue * color.multiplier + initialValue * tapsCounter
        return String(result)
    }
}


