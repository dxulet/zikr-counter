//
//  ZikrCounterView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 08.01.2023.
//

import SwiftUI
import RealmSwift
import AVFoundation

struct ZikrCounterView: View {
    @ObservedRealmObject var zikr: Zikr
    @ObservedResults(Zikr.self) var zikrs
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.realm) var realm
    
    var body: some View {
        NavigationView {
            // Use a PageView to display all zikrs
            ScrollView {
                PageView(selection: $zikr.id,
                         indexDisplayMode: .always,
                         indexBackgroundDisplayMode: .interactive
                ) {
                    ForEach(zikrs) { zikr in
                        ZStack {
                            // Apply gradient background
                            LinearGradient(
                                colors: zikr.numToGradient(num: zikr.colors),
                                startPoint: .topLeading,
                                endPoint: .trailing)
                            ZikrInfoView(zikr: zikr)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape")
                                .foregroundColor(.white)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: ZikListView()) {
                            Image("menu")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
        .onAppear(perform: viewModel.loadZikrs)
    }
}

struct ZikrInfoView: View {
    @ObservedRealmObject var zikr: Zikr
    
    var body: some View {
        VStack {
            VStack {
                Text("\(zikr.arabic)")
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .opacity(0.9)
                    .padding(.bottom, 4)
                    .padding(.leading)
                    .padding(.trailing)
                Text("\(zikr.pronunciation)")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .padding(.trailing)
                Text("\(zikr.translation)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .padding(.trailing)
            }
            .frame(width: 350, height: 350)
            .background(.ultraThinMaterial.blendMode(.softLight).opacity(0.76), in: RoundedRectangle(cornerRadius: 8,
                                                                                                     style: .continuous))
            .padding(.top, 50)
            CounterView(zikr: zikr)
        }
    }
}

struct CounterView: View {
    @ObservedRealmObject var zikr: Zikr
    private let generator = UINotificationFeedbackGenerator()
    private static var player: AVAudioPlayer!
    @AppStorage("vibrationEnabled") var vibrationEnabled = true
    @AppStorage("soundEnabled") var soundEnabled = true
    
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
            Label("Reset", systemImage: "arrow.clockwise").labelStyle(.iconOnly).foregroundColor(Color.infoColor).font(.title2)
        }
        .buttonStyle(.plain)
        .padding()
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
        if vibrationEnabled {
            if Int(zikr.current) % 33 == 0 {
                generator.notificationOccurred(.success)
            }
        }
        if soundEnabled {
            playZikrSound()
        }
    }
    
    // function to play sound on click
    func playZikrSound() {
        let url = Bundle.main.url(forResource: "clickSound", withExtension: "wav")
        CounterView.player = try! AVAudioPlayer(contentsOf: url!)
        CounterView.player.prepareToPlay()
        CounterView.player.play()
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
