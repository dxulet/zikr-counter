//
//  ZikrListView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 08.01.2023.
//

import SwiftUI
import RealmSwift

struct ZikrListView: View {
    @State var zikrFormIsPresented = false
    @Environment(\.dismiss) var dismiss
    @ObservedResults(Zikr.self) var zikrs
    
    @ViewBuilder var newZikrButton: some View {
        Button(action: openNewIngredient) {
            Label("Custom Zikr", systemImage: "plus.circle.fill")
        }
        .foregroundColor(.green)
        .sheet(isPresented: $zikrFormIsPresented) {
            ZikrFormView(zikr: Zikr())
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(zikrs) { zikr in
                    ZikrRowView(zikr: zikr)
                }
                newZikrButton
            }
            .navigationTitle("My Zikrs 📿")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "xmark").labelStyle(.iconOnly).foregroundColor(Color("zikrColor"))
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

extension ZikrListView {
    func openNewIngredient() {
        zikrFormIsPresented.toggle()
    }
}

struct ZikrListView_Previews: PreviewProvider {
    static var previews: some View {
        ZikrListView()
    }
}
