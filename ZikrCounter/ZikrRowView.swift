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
    // Observed Realm object for the Zikr
    @ObservedRealmObject var zikr: Zikr
    
    var body: some View {
        HStack {
            // Button to open the Zikr goal form
            Button(action: openZikrGoalForm) {
                VStack(alignment: .leading) {
                    HStack {
                        ZStack {
                            // Progress view and pronunciation text
                            CircularProgressView(current: $zikr.current,
                                                 goal: $zikr.target,
                                                 width: 5,
                                                 color: Color.zikrColor)
                            .frame(width: 33, height: 33)
                            Text("\(Int(zikr.current))")
                                .foregroundColor(zikr.current >= zikr.target ?
                                                 Color.reachedColor : Color.zikrColor)
                                .fontWeight(.medium)
                        }
                        Spacer()
                        Text("\(zikr.arabic)")
                    }
                    // Zikr name and translation text
                    Text("\(zikr.title)")
                        .font(.headline)
                        .fontWeight(.medium)
                    Text("\(zikr.translation)")
                        .font(.subheadline)
                        .italic()
                }
                .lineLimit(1)
                .foregroundColor(Color.zikrColor)
            }
            .buttonStyle(.plain)
            // Sheet to display the Zikr goal form
            .sheet(isPresented: $zikrGoalFormIsPresented) {
                ZikrFormView(zikr: zikr)
            }
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
                .stroke(current >= goal ? Color.reachedColor : color,
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
}

struct ZikrRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZikrRowView(zikr: ZikrMock.zikr1)
    }
}
