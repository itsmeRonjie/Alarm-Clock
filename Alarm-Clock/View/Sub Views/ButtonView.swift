//
//  ButtonView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct ButtonView: View {
    let text: LocalizedStringKey
    var endRadius = 40.0
    var scaleX = 3.0
    
    var body: some View {
        Text(text)
            .foregroundColor(alarmBlack)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                MainGradient(
                    endRadius: endRadius,
                    scaleX: scaleX
                )
                .cornerRadius(30)
            )
    }
}


#Preview {
    VStack {
        ButtonView(text: "add alarm")
        ButtonView(text: "next")
        ButtonView(text: "create")
    }
    .padding()
}
