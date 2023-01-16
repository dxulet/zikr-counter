//
//  ColorGradients.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 16.01.2023.
//

import SwiftUI

enum ColorGradients: CaseIterable {
    
    case customgrad
    case blueblack
    case greenblack
    
    var colors: [Color] {
        switch self {
        case .customgrad:
            return [Color(red: 0.146, green: 0.425, blue: 0.52),
                    Color(red: 0.002, green: 0.168, blue: 0.358)
                    ]
        case .blueblack:
            return [Color.blue, Color.black]
        case .greenblack:
            return [Color.green, Color.black]
        }
    }
    
    var color: Color {
        Color(rawValue)
    }
}
