//
//  ZikrCounterView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 08.01.2023.
//

import SwiftUI
import RealmSwift

struct ZikrCounterView: View {
    @ObservedRealmObject var zikr: Zikr
    @ObservedResults(Zikr.self) var zikrs
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.realm) var realm
    
    var body: some View {
        NavigationView {
            ZStack {
                // Apply gradient background
                LinearGradient(colors: zikr.colors,
                               startPoint: .topLeading,
                               endPoint: . trailing
                )
                .ignoresSafeArea()
                VStack {
                    // Use a PageView to display all zikrs
                    PageView(selection: $zikr.id,
                             indexDisplayMode: .always,
                             indexBackgroundDisplayMode: .interactive
                    ) {
                        ForEach(zikrs) { zikr in
                            ZikrInfoView(zikr: zikr)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ZikListView()) {
                        Image("menu")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                }
            }
        }.onAppear(perform: viewModel.loadZikrs)
    }
}

struct ZikrInfoView: View {
    @ObservedRealmObject var zikr: Zikr
    
    var body: some View {
        VStack {
            ZStack {
                // Create a rounded rectangle for the background
                Rectangle()
                    .frame(width: 350, height: 400)
                    .background(.ultraThinMaterial)
                    .opacity(0.8)
                    .cornerRadius(15)
                VStack {
                    VStack {
                        Text("\(zikr.arabic)")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .opacity(0.9)
                            .lineLimit(5)
                            .padding(.bottom, 4)
                            .padding(.leading)
                            .padding(.trailing)
                        Text("\(zikr.pronunciation)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        Text("\(zikr.translation)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .multilineTextAlignment(.center)
                            .padding(.trailing)
                            .padding(.leading)
                    }.padding(.bottom, 20)
                    
                    HStack {
                        Spacer()
                        Text("\(zikr.hadith)")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .font(.system(size: 14))
                            .padding(.top, 4)
                            .padding(.leading, 40)
                            .padding(.trailing, 40)
                        Spacer()
                    }
                }
            }
            CounterView(zikr: zikr)
        }
    }
}

struct CounterView: View {
    @ObservedRealmObject var zikr: Zikr
    
    var body: some View {
        VStack {
            Button(action: countUp) {
                ZStack {
                    Circle()
                        .frame(width: 300, height: 250)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .opacity(0.1)
                    CircularProgressView(
                        current: $zikr.current,
                        goal: $zikr.target,
                        width: 10,
                        color: Color.infoColor.opacity(0.8)
                    )
                    .frame(width: 300, height: 240)
                    VStack {
                        Text("\(Int(zikr.current))/\(Int(zikr.target))")
                            .foregroundColor(
                                zikr.current >= zikr.target ?
                                Color.reachedColor : Color.infoColor.opacity(0.9)
                            )
                            .font(.system(size: 33))
                            .fontWeight(.heavy)
                        
                        Text("\(Int(zikr.total))")
                            .font(.subheadline)
                            .foregroundColor(Color.infoColor)
                            .opacity(0.7)
                    }
                }
            }
            .buttonStyle(.plain)
            .padding()
        }
        Button(action: reset) {
            Label("Reset", systemImage: "arrow.clockwise").labelStyle(.iconOnly).foregroundColor(Color.infoColor)
        }
        .buttonStyle(.plain)
    }
}

//MARK: - Actions


extension CounterView {
    // function to count up the zikr
    func countUp() {
        let realm = try! Realm()
        try! realm.write {
            zikr.thaw()?.current += 1
            zikr.thaw()?.total += 1
        }
    }
    
    // function to reset the zikr
    func reset() {
        let realm = try! Realm()
        try! realm.write {
            zikr.thaw()?.current = 0
        }
    }
}

struct PageView<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    @Binding private var selection: SelectionValue
    private let indexDisplayMode: PageTabViewStyle.IndexDisplayMode
    private let indexBackgroundDisplayMode: PageIndexViewStyle.BackgroundDisplayMode
    private let content: () -> Content
    
    init(
        selection: Binding<SelectionValue>,
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
        indexBackgroundDisplayMode: PageIndexViewStyle.BackgroundDisplayMode = .automatic,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._selection = selection
        self.indexDisplayMode = indexDisplayMode
        self.indexBackgroundDisplayMode = indexBackgroundDisplayMode
        self.content = content
    }
    
    var body: some View {
        TabView(selection: $selection) {
            content()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: indexDisplayMode))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: indexBackgroundDisplayMode))
    }
}

extension PageView where SelectionValue == Int {
    init(
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
        indexBackgroundDisplayMode: PageIndexViewStyle.BackgroundDisplayMode = .automatic,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._selection = .constant(0)
        self.indexDisplayMode = indexDisplayMode
        self.indexBackgroundDisplayMode = indexBackgroundDisplayMode
        self.content = content
    }
}

struct ZikrCounterView_Previews: PreviewProvider {
    static var previews: some View {
        ZikrCounterView(zikr: Zikr())
    }
}
