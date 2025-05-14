//
//  GrayedTextView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct GrayedTextView: View {
    let text: LocalizedStringKey
    var font: Font = .headline
    var body: some View {
        Text(text)
            .foregroundStyle(.gray)
            .font(font)
    }
}

#Preview {
    GrayedTextView(text: "Alarm")
}
