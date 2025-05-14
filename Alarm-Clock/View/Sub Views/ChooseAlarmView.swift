//
//  ChooseAlarmView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct ChooseAlarmView: View {
    @Binding var currentAlarmIndex: Int?
    @EnvironmentObject var lnManager: LocalNotificationManager
    let addEditViewType: AddEditViewType
    
    var body: some View {
        if let currentAlarmIndex = currentAlarmIndex {
            if addEditViewType == .standard {
                AddEditAlarmView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: lnManager.alarmViewModels[currentAlarmIndex]
                )
            } else {
                AddEditCircularAlarmView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: lnManager.alarmViewModels[currentAlarmIndex]
                )
            }
        } else {
            if addEditViewType == .standard {
                AddEditAlarmView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: .DefaultAlarm()
                )
            } else {
                AddEditCircularAlarmView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: .DefaultAlarm()
                )
            }
        }
    }
}

#Preview {
    ChooseAlarmView(
        currentAlarmIndex: .constant(nil),
        addEditViewType: .standard
    )
}
