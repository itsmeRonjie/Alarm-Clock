//
//  AlarmRowView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct AlarmRowViewButton: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    let model: AlarmModel
    let i: Int
    @Binding var currentIndex: Int?
    @Binding var isActive: Bool
    
    var body: some View {
        HStack(spacing: 35) {
            Button {
                currentIndex = i
                isActive.toggle()
            } label: {
                HStack {
                    Image(systemName: model.activity)
                        .foregroundColor(model.activityColor)
                        .font(.title)
                    
                    Spacer()
                    
                    Text("\(getTimeFromDate(date:model.start)) — \(getTimeFromDate(date:model.end))")
                        .font(.title)
                        .fontWeight(model.alarmEnabled ? .regular : .thin)
                        .scaleEffect(model.alarmEnabled ? 1.05 : 1.0)
                        .opacity(model.alarmEnabled ? 1.0 : 0.7)
                }
            }
            
            if i < lnManager.alarmViewModels.count {
                TheToggleView(isOn: $lnManager.alarmViewModels[i].alarmEnabled)
            }
        }
        .onChange(of: model.alarmEnabled) { _, alarmEnabled in
            if alarmEnabled {
                print("Enable alarm")
                Task {
                    await lnManager.schedule(localNotification: model)
                }
            } else {
                print("Disable alarm")
                lnManager.removeRequest(id: model.id)
            }
        }
    }
}

#Preview {
    AlarmRowViewButton(
        model: .DefaultAlarm(),
        i: 0,
        currentIndex: .constant(0),
        isActive: .constant(false)
    )
    .environmentObject(LocalNotificationManager())
}
