//
//  TimePicker.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct TimePicker: View {
    @Binding var time: Date
    let scale: CGFloat
    
    var body: some View {
        DatePicker(
            "",
            selection: $time,
            displayedComponents: .hourAndMinute
        )
        .scaleEffect(scale)
        .labelsHidden()
    }
}

#Preview {
    TimePicker(
        time: .constant(Date()),
        scale: 1.3
    )
}
