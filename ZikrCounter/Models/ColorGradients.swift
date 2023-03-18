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
    case instaGrad
    case zikrColor
    case eveningSunshine
    case memairani
    case metapolis
    
    var id: Int {
        return self.rawValue
    }
    
    var zikrColor: [Color] {
        switch self {
        case .customgrad:
            return [Color("lightBlue"), Color("darkBlue")]
        case .instaGrad:
            return [.purple, .blue]
        case .zikrColor:
            return [Color("zikrBackground")]
        case .eveningSunshine:  
            return [Color(hex: "#b92b27"), Color(hex: "#1565C0")]
        case .memairani:
            return [Color(hex: "#aa4b6b"), Color(hex: "#6b6b83"), Color(hex: "#3b8d99")]
        case .metapolis:
            return [Color(hex: "#659999"), Color(hex: "#f4791f")]
        }
    }
}
