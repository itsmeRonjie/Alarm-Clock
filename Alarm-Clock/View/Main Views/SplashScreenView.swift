//
//  SplashScreenView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 0.3
    @State private var fontSize = 12.0
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            ZStack {
                FourCoolCircles(
                    color1: alarmBlue,
                    color2: .clear
                )
                
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        CoolTextView(
                            text: LocalizedStringKey("hello there!"),
                            size: fontSize
                        )
                        
                        CoolTextView(
                            text: LocalizedStringKey("let's add an alarm"),
                            size: fontSize
                        )
                    }
                    .multilineTextAlignment(.leading)
                    .padding()
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            opacity = 1.0
                            fontSize = 36.0
                        }
                    }
                    
                    Spacer()
                    
                    Image(welcome)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.7)
                    
                    Spacer()
                }
            }
            .opacity(opacity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
            .onTapGesture {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
        .environmentObject(LocalNotificationManager())
}
