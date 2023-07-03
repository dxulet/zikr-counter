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
    @Persisted var color = ColorGradients.customgrad.rawValue
}

extension Zikr {
    func numToGradient(num: Int) -> [Color] {
        if num == 0 { return ColorGradients.customgrad.zikrColor }
        else if num == 1 { return ColorGradients.instaGrad.zikrColor }
        else if num == 2 { return ColorGradients.zikrColor.zikrColor }
        else if num == 3 { return ColorGradients.eveningSunshine.zikrColor }
        else if num == 4 { return ColorGradients.memairani.zikrColor }
        else { return ColorGradients.metapolis.zikrColor }
    }
}
