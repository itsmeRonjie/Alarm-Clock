//
//  AlarmToggleView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct AlarmToggleView: View {
    @Binding var alarmEnabled: Bool
    
    var body: some View {
        HStack {
            GrayedTextView(text: "alarm")
            Spacer()
            TheToggleView(isOn: $alarmEnabled)
        }
        .padding()
    }
}

#Preview {
    VStack {
        AlarmToggleView(alarmEnabled: .constant(true))
        AlarmToggleView(alarmEnabled: .constant(false))
    }
}
