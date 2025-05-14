//
//  SoundMenuViewFromButton.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct SoundMenuViewFromButton: View {
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        
        NavigationLink {
            SoundMenuView(alarmSound: $alarmModel.sound)
        } label: {
            HStack {
                Text("Sound")
                    .fontWeight(.semibold)
                Text(alarmModel
                    .sound
                    .rawValue
                    .formatSoundName
                )
                .font(.caption)
                .fontWeight(.thin)
            }
            .padding(7)
            .overlay(Capsule().stroke())
        }
    }
}

struct SoundMenuView: View {
    @Binding var alarmSound: Sounds
    var body: some View {
        Form {
            Section(header: Text("Ringtone Sounds")) {
                ForEach(ringToneSoundsList, id: \.self) { sound in
                    Button {
                        alarmSound = sound
                        playSound(sound: sound.rawValue)
                    } label: {
                        HStack {
                            Image(systemName:  "checkmark")
                                .foregroundColor(alarmPurple)
                                .fontWeight(.semibold)
                                .opacity(alarmSound == sound ? 1.0 : 0.0)
                            
                            Text(sound.rawValue.formatSoundName)
                                .foregroundColor(alarmBlack)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
            
            Section(header: Text("Sounds of Nature")) {
                ForEach(natureSoundsList, id: \.self) { sound in
                    Button {
                        alarmSound = sound
                        playSound(sound: sound.rawValue)
                    } label: {
                        HStack {
                            Image(systemName:  "checkmark")
                                .foregroundColor(alarmPurple)
                                .fontWeight(.semibold)
                                .opacity(alarmSound == sound ? 1.0 : 0.0)
                            
                            Text(sound.rawValue.formatSoundName)
                                .foregroundColor(alarmBlack)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
        }
        .onDisappear {
            stopPlaying()
        }
    }
}

#Preview {
    NavigationStack {
        SoundMenuViewFromButton(
            alarmModel: .constant(AlarmModel.DefaultAlarm())
        )
    }
}
