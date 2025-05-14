//
//  CircularTimeView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct CircularTimeView: View {
    let currentAlarmIndex: Int?
    let size: CGFloat
    @Binding var alarmModel: AlarmModel

    var startTime: Date {
        alarmModel.start
    }
    
    var endTime: Date {
        alarmModel.end
    }
    
    var percentDifference: CGFloat {
        let value = dateToPercent(date: endTime) - dateToPercent(date: startTime)
        return value >= 0 ? value : 1 + value
    }
    
    var startDateToPercent: CGFloat {
        dateToPercent(date: startTime)
    }
    
    var endDateToPercent: CGFloat {
        startDateToPercent + percentDifference
    }
    
    var rotateCircleOffset: CGFloat {
        360 * startDateToPercent
    }
    
    var body: some View {
        ZStack {
            CentralDatePickerView(
                size: size,
                alarmModel: $alarmModel
            )
            
            TimeArcView(
                percentDifference: percentDifference,
                strokeStyle: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round,
                    lineJoin: .round
                ),
                size: size,
                rotateCircleOffset: rotateCircleOffset,
                color: .black
            )
            
            TimeArcView(
                percentDifference: percentDifference,
                strokeStyle: StrokeStyle(
                    lineWidth: 15,
                    dash: [1,2]
                ),
                size: size,
                rotateCircleOffset: rotateCircleOffset,
                color: .gray
            )
            
            DisplayIconOnCircularTimeView(
                time: startTime,
                size: size,
                percent: startDateToPercent
            )
            
            DisplayIconOnCircularTimeView(
                time: endTime,
                size: size,
                percent: endDateToPercent
            )
        }
    }
}

#Preview {
    VStack(spacing: 50) {
        CircularTimeView(
            currentAlarmIndex: nil,
            size: screenWidth / 2,
            alarmModel: .constant(.DefaultAlarm())
        )
    }
}
