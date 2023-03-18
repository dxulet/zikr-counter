//
//  ViewModel.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 12.01.2023.
//

import SwiftUI
import RealmSwift

class ViewModel: ObservableObject {
    @Published var zikrs = [Zikr]()
    let realm = try! Realm()
    let userDefaults = UserDefaults.standard
    
    func loadZikrs() {
        if !userDefaults.bool(forKey: "zikrsLoaded") {
            for zikr in ZikrMock.defaultZikrProvider {
                DispatchQueue.main.async {
                    try! self.realm.write {
                        self.realm.add(zikr)
                    }
                }
            }
            userDefaults.set(true, forKey: "zikrsLoaded")
        }
    }
}
