//
//  ZikrListView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 08.01.2023.
//

import SwiftUI
import RealmSwift

struct ZikListView: View {
    @State var zikrFormIsPresented = false
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
            List {
                ForEach(zikrs) { zikr in
                    ZikrRowView(zikr: zikr)
                }
                .onDelete(perform: $zikrs.remove)
                newZikrButton
            }
            .navigationTitle("My Zikrs 📿")
    }
}

extension ZikListView {
  func openNewIngredient() {
    zikrFormIsPresented.toggle()
  }
}

struct ZikrListView_Previews: PreviewProvider {
    static var previews: some View {
        ZikListView()
    }
}
