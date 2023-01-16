//
//  ContentView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 06.01.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    var body: some View {
        ZikrCounterView(zikr: Zikr())
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
