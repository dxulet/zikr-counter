//
//  Zikr.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 07.01.2023.
//

import SwiftUI
import RealmSwift

class Zikr: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var pronunciation = ""
    @Persisted var arabic = ""
    @Persisted var translation = ""
    @Persisted var hadith = ""
    @Persisted var target: Double = 0.0
    @Persisted var current: Double = 0.0
    @Persisted var total = 0
    @Persisted var colors = ColorGradients.customgrad.rawValue
}

extension Zikr {
    func numToGradient(num: Int) -> [Color] {
        if num == 0 { return ColorGradients.customgrad.zikrColors }
        else if num == 1 { return ColorGradients.blueblack.zikrColors }
        else if num == 2 { return ColorGradients.greenblack.zikrColors }
        else if num == 3 { return ColorGradients.tealBlack.zikrColors }
        else if num == 4 { return ColorGradients.instaGrad.zikrColors}
        else { return ColorGradients.zikrColor.zikrColors}
    }
}

extension Color {
    static let reachedColor = Color(red: 0.16, green: 0.617, blue: 0.565)
    static let infoColor = Color(red: 0.914, green: 0.767, blue: 0.415)
    static let counterColor = Color(red: 0.217, green: 0.445, blue: 0.556)
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
