//
//  BackgroundSelectionView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 23.02.2023.
//

import SwiftUI
import RealmSwift

struct BackgroundSelectionView: View {
    let gradients: [ColorGradients] = [.customgrad, .instaGrad, .zikrColor, .eveningSunshine, .memairani, .metapolis]
    @Binding var selectedGradient: ColorGradients
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(gradients, id: \.self) { gradient in
                        VStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: gradient.zikrColor), startPoint: .topLeading, endPoint: .trailing)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(selectedGradient == gradient ? .green : .clear, lineWidth: 4)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        selectedGradient = gradient
                                    }
                                }
                        }
                    }
                    .frame(width: geo.size.width / 4)
                }
            }
        }
        .frame(height: 100)
    }
}
