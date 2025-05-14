//
//  CentralDatePickerView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct CentralDatePickerView: View {
    let size: CGFloat
    @Binding var alarmModel: AlarmModel
    
    var lineWidth: CGFloat = 10.0
    
    var body: some View {
        Circle()
            .stroke(alarmLightGray, lineWidth: lineWidth)
            .frame(width: size, height: size)
            .overlay(
                VStack {
                    VStack {
                        GrayedTextView(
                            text: "start",
                            font: .caption)
                        TimePicker(time: $alarmModel.start.animation(), scale: 1)
                    }
                    
                    Spacer()
                    
                    GrayedTextView(text: "Set the alarm")
                    
                    Spacer()
                    
                    VStack {
                        TimePicker(time: $alarmModel.end.animation(), scale: 1)
                        GrayedTextView(
                            text: "end",
                            font: .caption)
                    }
                }
                .padding()
                .padding(.vertical)
            )
    }
}

#Preview {
    CentralDatePickerView(
        size: 200,
        alarmModel: .constant(AlarmModel.DefaultAlarm())
    )
}
