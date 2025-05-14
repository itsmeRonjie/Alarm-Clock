//
//  SelectView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct SelectView: View {
    let width: CGFloat
    @Binding var addEditViewType: AddEditViewType
    @Binding var isActive: Bool
    
    var isStandardView: Bool {
        addEditViewType == .standard
    }
    
    var isCircularView: Bool {
        addEditViewType == .circular
    }
    
    var body: some View {
        HStack {
            Button{
                withAnimation {
                    addEditViewType = .standard
                    isActive.toggle()
                }
            } label: {
                ImageDisplayView(name: standardViewImage, width: 50)
                    .scaleEffect(isStandardView ? 1.05 : 1.0)
                    .shadow(color: .blue, radius: isStandardView ? 5 : 0, x: 0, y: 0)
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    addEditViewType = .circular
                    isActive.toggle()
                }
            } label: {
                ImageDisplayView(name: circularViewImage, width: 50)
                    .scaleEffect(isCircularView ? 1.05 : 1.0)
                    .shadow(color: .blue, radius: isCircularView ? 5 : 0, x: 0, y: 0)
            }
        }
        .padding()
    }
}

#Preview {
    VStack {
        SelectView(width: 50, addEditViewType: .constant(.standard), isActive: .constant(true))
        SelectView(width: 50, addEditViewType: .constant(.circular), isActive: .constant(true))
    }
}
