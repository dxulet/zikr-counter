//
//  ColorGradients.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 16.01.2023.
//

import SwiftUI
import RealmSwift

enum ColorGradients: Int, CaseIterable, PersistableEnum {
    
    case customgrad
    case blueblack
    case greenblack
    case tealBlack
    case instaGrad
    
    var zikrColors: [Color] {
        switch self {
        case .customgrad:
            return [Color("lightBlue"), Color("darkBlue")]
        case .blueblack:
            return [Color.blue, Color.black]
        case .greenblack:
            return [Color.green, Color.black]
        case .tealBlack:
            return [Color.teal, Color.black]
        case .instaGrad:
            return [.purple, .blue]
        }
    }
}
