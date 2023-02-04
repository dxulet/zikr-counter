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
