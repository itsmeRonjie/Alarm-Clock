//
//  ToBedWakeUpView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct ToBedWakeUpView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        NavigationStack {
            VStack {
                CancelSaveAlarm(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: $alarmModel
                )
                
                AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
                
                Divider()
                
                HStack {
                    Grid {
                        GridRow {
                            TimeOfDayIcon(date: alarmModel.start)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                GrayedTextView(text: "start")
                                TimePicker(time: $alarmModel.start, scale: 1.3)
                            }
                        }
                        
                        GridRow {
                            HStack {
                                Divider()
                                    .frame(height: 30)
                                    .padding(2)
                            }
                        }
                        
                        GridRow {
                            Image(systemName: alarmModel.activity)
                                .foregroundColor(alarmModel.activityColor)
                                .font(.headline)
                            
                            SelectActivityView(
                                currentColorIndex: $alarmModel.colorIndex,
                                currentActivity: $alarmModel.activity
                            )
                        }
                        .padding(.vertical)
                        
                        GridRow {
                            HStack {
                                Divider()
                                    .frame(height: 30)
                                    .padding(2)
                            }
                        }
                        
                        GridRow {
                            TimeOfDayIcon(date: alarmModel.end)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                TimePicker(time: $alarmModel.end, scale: 1.3)
                                GrayedTextView(text: "end")
                            }
                        }
                        
                        GridRow {
                            Text("")
                            
                            SoundMenuViewFromButton(alarmModel: $alarmModel)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .padding()
            .background(alarmCardBackgroundColor.cornerRadius(20))
            .padding()
        }
    }
}

#Preview {
    ZStack {
        Color
            .gray
            .opacity(0.3)
            .ignoresSafeArea()
        
        ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
