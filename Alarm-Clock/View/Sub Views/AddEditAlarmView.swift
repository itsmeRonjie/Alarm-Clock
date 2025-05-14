//
//  AddEditAlarmView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    @State private var showYouDidItView = true
    
    var body: some View {
        ZStack {
            alarmBackgroundColor
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack {
                if showYouDidItView {
                    YouDidItView()
                }
                
                ToBedWakeUpView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: alarmModel)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    showYouDidItView = false
                }
            }
        }
    }
}

#Preview {
    AddEditAlarmView(
        currentAlarmIndex: nil,
        alarmModel: .DefaultAlarm()
    )
}
