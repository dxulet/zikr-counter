//
//  SettingsView.swift
//  ZikrCounter
//
//  Created by Daulet Ashikbayev on 21.01.2023.
//

import SwiftUI
import RealmSwift
 
struct SettingsView: View {
    @AppStorage("vibrationEnabled") var vibrationEnabled = true
    @AppStorage("soundEnabled") var soundEnabled = true
    @AppStorage("dailyGoalEnabled") var dailyGoalEnabled = true
    @AppStorage("dailyReminderEnabled") var dailyReminderEnabled = false
    @State var dailyReminderTime = Date(timeIntervalSince1970: 0)
    let realm = try! Realm()
    @ObservedRealmObject var currentZikr: Zikr
    @State var selectedGradient = ColorGradients.customgrad
    @ObservedResults(Zikr.self) var zikrs
    @AppStorage("dailyReminderTime") var dailyReminderTimeShadow: Double = 0
    init(_ currentZikr: Zikr) {
        self.currentZikr = currentZikr
    }
    var body: some View {
        List {
            Section("Zikrs") {
                Toggle("Vibration in every 33", isOn: $vibrationEnabled)
                Toggle("Sound on button click", isOn: $soundEnabled)
            }
            
            Section("Notifications") {
                Toggle("Daily Goal", isOn: $dailyGoalEnabled)
                Toggle("Daily Reminder", isOn: Binding(
                    get: { dailyReminderEnabled },
                    set: { newValue in
                        dailyReminderEnabled = newValue
                        configureNotification()
                    }
                ))
                if dailyReminderEnabled {
                    DatePicker(
                        "Time",
                        selection: Binding(
                            get: { dailyReminderTime },
                            set: { newValue in
                                dailyReminderTimeShadow = newValue.timeIntervalSince1970
                                dailyReminderTime = newValue
                                configureNotification()
                            }
                        ),
                        displayedComponents: .hourAndMinute
                    )
                }
            }
            
            Section("Choose Zikr Background ") {
                // MARK: Use BackgroundSelectionView to enable user to 
            }
        }
        .onAppear {
            dailyReminderTime = Date(timeIntervalSince1970: dailyReminderTimeShadow)
            selectedGradient = ColorGradients(rawValue: currentZikr.color) ?? .customgrad
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
    
    func configureNotification() {
        if dailyReminderEnabled {
            // 1
            LocalNotifications.shared.createReminder(
                time: dailyReminderTime)
        } else {
            // 2
            LocalNotifications.shared.deleteReminder()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(ZikrMock.zikr2)
    }
}
