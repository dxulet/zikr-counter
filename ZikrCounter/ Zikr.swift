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
    @Persisted var colors: [Color] = []
}

extension Color {
    static let zikrColor = Color(red: 0.152, green: 0.274, blue: 0.327)
    static let reachedColor = Color(red: 0.16, green: 0.617, blue: 0.565)
    static let infoColor = Color(red: 0.914, green: 0.767, blue: 0.415)
    static let counterColor = Color(red: 0.217, green: 0.445, blue: 0.556)
}
