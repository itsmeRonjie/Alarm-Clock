//
//  EnableNotifications.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct EnableNotifications: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    var body: some View {
        ZStack {
            FourCoolCircles()
            VStack {
                Spacer()
                CoolTextView(
                    text: LocalizedStringKey("Enable notifications, please"),
                    size: 48
                )
                .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    lnManager.openSettings()
                } label: {
                    ButtonView(text: "enable")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    EnableNotifications()
        .environmentObject(LocalNotificationManager())
}
