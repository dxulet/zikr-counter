//
//  ZikrFormView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 08.01.2023.
//

import SwiftUI
import RealmSwift

struct ZikrFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    
    @ObservedRealmObject var zikr: Zikr
    var isUpdating: Bool {
        zikr.realm != nil
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Zikr Name", text: $zikr.title)
                TextField("Goal Quantity", value: $zikr.target, formatter: Formatter.numberFormatter)
                    .keyboardType(.decimalPad)
                TextField("Enter a translation", text: $zikr.translation)
                TextField("Enter a trascription", text: $zikr.pronunciation)
                
                Section("Notes 📝") {
                    TextEditor(text: $zikr.hadith)
                }
            }
            .navigationTitle("Your Zikr 📿")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(isUpdating ? "Done" : "Save") {
                        if isUpdating {
                            dismiss()
                        } else {
                            save()
                        }
                    }
                    .disabled(zikr.title.isEmpty && zikr.target == 0)
                }
            }
        }
    }
}

extension Formatter {
    static let numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .none
        nf.zeroSymbol = ""
        return nf
    }()
}

//MARK: - ACTIONS
extension ZikrFormView {
    func save() {
        try? realm.write {
            realm.add(zikr)
        }
        dismiss()
    }
}

struct ZikrFormView_Previews: PreviewProvider {
    static var previews: some View {
        ZikrFormView(zikr: Zikr())
    }
}
