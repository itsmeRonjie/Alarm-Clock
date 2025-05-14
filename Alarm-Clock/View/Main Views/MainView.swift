//
//  ContentView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/13/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        TabView {
            if lnManager.isAuthorized {
                Text("ListOfTheAlarmsView")
                    .tabItem({
                        Label("Alarms", systemImage: "alarm.fill")
                    })
                
                Text("AboutView")
                    .tabItem({
                        Label("About", systemImage: "info.circle.fill")
                    })
            } else {
                EnableNotifications()
            }
        }
        .ignoresSafeArea()
        .task {
            try? await lnManager.requestAuthorization()
        }
        .onChange(of: scenePhase) { _, newValue in
            if newValue == .active {
                Task {
                    await lnManager.getCurrentSettings()
                    await lnManager.getPendingAlarms()
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(LocalNotificationManager())
}
