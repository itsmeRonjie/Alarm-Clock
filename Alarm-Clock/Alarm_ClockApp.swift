//
//  Alarm_ClockApp.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/13/25.
//

import SwiftUI

@main
struct Alarm_ClockApp: App {
    @StateObject var lnManager: LocalNotificationManager = LocalNotificationManager()
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(lnManager)
        }
    }
}
