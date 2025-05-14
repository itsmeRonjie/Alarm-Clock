//
//  MainGradient.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct MainGradient: View {
    var startRadius: CGFloat = 0.0
    let endRadius: CGFloat
    var scaleX: CGFloat = 2.0
    var opacityLinGrad = 0.5
    var opacityRadGrad = 1.0
    var yellowColor = alarmYellow
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [alarmBlue, alarmPurple, alarmPink],
                startPoint: .top,
                endPoint: .bottom)
            .opacity(opacityLinGrad)
            
            RadialGradient(
                colors: [yellowColor, .clear],
                center: .bottom,
                startRadius: startRadius,
                endRadius: endRadius)
            .opacity(opacityRadGrad)
            .scaleEffect(x: scaleX)
        }
    }
}

#Preview {
    MainGradient(endRadius: 75)
        .frame(width: screenWidth, height: 100)
}
