//
//  TimeOfDayIcon.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct TimeOfDayIcon: View {
    let date: Date
    var percent: CGFloat {
        dateToPercent(date: date)
    }
    
    var hour: Int {
        Int(24 * percent)
    }
    
    var image: (name: String, color: Color) {
        switch(hour) {
        case 6..<8:
            return ("sun.and.horizon.fill", .orange)
        case 8..<17:
            return ("sun.max.fill", .yellow)
        case 17..<20:
            return ("sun.and.horizon.fill", .pink)
        case 20..<23:
            return ("moon.fill", .black)
        default:
            return ("moon.stars.fill", .black)
        }
    }
    
    var body: some View {
        Image(systemName: image.name)
            .foregroundColor(image.color)
    }
}

#Preview {
    List(0..<24) { i in
        HStack {
            let theDate = addHourToDate(date: Date(), numHours: i, numMinutes: 0)
            Text(getTimeFromDate(date: theDate))
            Spacer()
            TimeOfDayIcon(date: theDate)
        }
        .padding()
    }
}
