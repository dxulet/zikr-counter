//
//  ZikrRowView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 07.01.2023.
//

import SwiftUI
import RealmSwift

struct ZikrRowView: View {
    // State variable to control the presentation of the Zikr goal form
    @State private var zikrGoalFormIsPresented = false
    @State private var presentAlert = false
    @State private var addedZikr = 0
    @Environment(\.realm) var realm
    // Observed Realm object for the Zikr
    @ObservedRealmObject var zikr: Zikr
    
    var body: some View {
        // Button to open the Zikr goal form
        HStack {
            Button(action: openZikrGoalForm) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(zikr.arabic)")
                        Spacer()
                        ZStack {
                            // Progress view and pronunciation text
                            CircularProgressView(current: $zikr.current,
                                                 goal: $zikr.target,
                                                 width: 4,
                                                 color: Color("zikrColor"))
                            .frame(width: 30, height: 30)
                            Text("\(Int(zikr.current))")
                                .foregroundColor(zikr.current >= zikr.target ?
                                                 Color.reachedColor : Color("zikrColor"))
                                .fontWeight(.medium)
                                .font(.callout)
                        }
                        .padding(.leading)
                    }
                    Text("\(zikr.title)")
                        .font(.headline)
                        .fontWeight(.medium)
                }
                .lineLimit(1)
                .foregroundColor(Color("zikrColor"))
            }
            .buttonStyle(.plain)
//            Spacer()
//            VStack {
//
//                Button(action: {
//                    presentAlert.toggle()
//                }, label: {
//                    Label("", systemImage: "plus.circle").labelStyle(.iconOnly)
//                })
//                .buttonStyle(.plain)
//                .foregroundColor(Color(hex: "#d93455").opacity(0.7))
//                .fontWeight(.semibold)
//                .alert("Insert your counted zikr", isPresented: $presentAlert) {
//                    TextField("Counted Zikr", value: $addedZikr, formatter: .numberFormatter)
//                        .keyboardType(.decimalPad)
//                    Button("Insert", action: insertZikrs)
//                    Button("Cancel", role: .cancel) { }
//                }
//            }
        }
        // Sheet to display the Zikr goal form
        .sheet(isPresented: $zikrGoalFormIsPresented) {
            ZikrFormView(zikr: zikr)
        }
    }
}

// Circular progress view
struct CircularProgressView: View {
    @Binding var current: Double
    @Binding var goal: Double
    var width: CGFloat
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: width)
                .foregroundColor(.gray)
                .opacity(0.2)
            Circle()
                .trim(from: 0.0, to: CGFloat(current / goal))
                .stroke(current >= goal ? Color.reachedColor.opacity(0.6) : color,
                        style: StrokeStyle(lineWidth: width, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: current)
        }
    }
}

extension ZikrRowView {
    func openZikrGoalForm() {
        zikrGoalFormIsPresented.toggle()
    }
    
    func insertZikrs() {
        try! realm.write {
            zikr.thaw()?.current += Double(addedZikr)
            zikr.thaw()?.total += addedZikr
        }
    }
}

struct ZikrRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZikrRowView(zikr: ZikrMock.zikr2)
    }
}
