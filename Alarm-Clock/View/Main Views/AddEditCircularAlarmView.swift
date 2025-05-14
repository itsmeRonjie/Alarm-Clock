//
//  AddEditCircularAlarmView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct AddEditCircularAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        VStack {
            CancelSaveAlarm(
                currentAlarmIndex: currentAlarmIndex,
                alarmModel: $alarmModel
            )
            
            AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
            
            Divider()
            
            Spacer()
            
            CircularTimeView(
                currentAlarmIndex: currentAlarmIndex,
                size: screenWidth / 2,
                alarmModel: $alarmModel
            )
            
            Spacer()
            
            SelectActivityViewExpanded(
                currentColorIndex: $alarmModel.colorIndex,
                currentActivity: $alarmModel.activity
            )
            
        }
        .padding()
    }
}

#Preview {
    AddEditCircularAlarmView(
        currentAlarmIndex: nil,
        alarmModel: .DefaultAlarm()
    )
}
