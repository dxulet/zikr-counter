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
    @State private var menuBarPresented = false
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss

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
                                colors: zikr.numToGradient(num: zikr.color),
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
                        Button {
                            menuBarPresented.toggle()
                        } label: {
                            Image("menu")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.plain)
                        .sheet(isPresented: $menuBarPresented) {
                            ZikrListView()
                                .presentationDetents([.fraction(0.6), .large])
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
        .onAppear {
            self.viewModel.loadZikrs()
        }
    }
}

struct ZikrInfoView: View {
    @ObservedRealmObject var zikr: Zikr
    @State private var popupPresented = false
    var body: some View {
        VStack {
            VStack {
                Text("\(zikr.arabic)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .opacity(0.9)
                    .padding(.bottom, 4)
                    .padding(.leading)
                    .padding(.trailing)
                Text("\(zikr.pronunciation)")
                    .fontWeight(.semibold)
                    .opacity(0.8)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .padding(.trailing)
                Text("\(zikr.translation)")
                    .font(.subheadline)
                    .opacity(0.8)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .padding(.trailing)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.45)
            .background(.ultraThinMaterial.blendMode(.softLight).opacity(0.76),
                        in: RoundedRectangle(cornerRadius: 8, style: .continuous))
            .foregroundColor(.white)
            .padding(.top, 50)
            .overlay(
                Button(action: {
                    withAnimation {
                        popupPresented.toggle()
                    }
                }, label: {
                    Label("More Info", systemImage: "info.circle").labelStyle(.iconOnly)
                })
                .foregroundColor(.white)
                .opacity(0.7)
                .padding()
                , alignment: .bottomTrailing)
            Button(action: reset) {
                Label("Reset", systemImage: "arrow.clockwise.circle").labelStyle(.iconOnly).foregroundColor(.white).font(.largeTitle).fontWeight(.light)
            }
            .opacity(0.6)
            .buttonStyle(.plain)
            .padding(.top, 33)
            .padding(.bottom, -40)
            .padding(.leading, 250)
            CounterView(zikr: zikr)
        }
        .popupView(horizontalPadding: 40, show: $popupPresented) {
            ZStack {
                LinearGradient(
                    colors: zikr.numToGradient(num: zikr.color),
                    startPoint: .topLeading,
                    endPoint: .trailing)
                Text("\(zikr.hadith)")
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .padding(.trailing)
            }
            .overlay(
                Button(action: {
                    withAnimation { popupPresented.toggle() }
                }, label: {
                    Label("", systemImage: "xmark").labelStyle(.iconOnly).font(.system(size: 22))
                })
                .foregroundColor(.white)
                .opacity(0.7)
                .padding()
                , alignment: .topTrailing)
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
        Button(action: withAnimation { countUp }) {
            ZStack {
                Circle()
                    .background(.ultraThinMaterial, in: Circle())
                    .frame(width: UIScreen.main.bounds.width * 0.586, height: UIScreen.main.bounds.height * 0.27)
                    .opacity(0.1)
                CircularProgressView(
                    current: $zikr.current,
                    goal: $zikr.target,
                    width: 10,
                    color: Color.infoColor.opacity(0.8)
                )
                .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.282)
                VStack {
                    Text("\(Int(zikr.current))")
                        .foregroundColor(
                            zikr.current >= zikr.target ?
                            Color.reachedColor.opacity(0.8) : Color.infoColor.opacity(0.8)
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
}

extension ZikrInfoView {
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
