//
//  PrimaryButton.swift
//  ParkAround
//
//  Created by Dalal Macbook on 02/01/2025.
//

import SwiftUI

struct PrimaryButton: View {
    let label: String
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(label)
                .foregroundStyle(.white)
                .font(Fonts.subheading)
                .padding(Spacing.medium)
        })
        .frame(maxWidth: .infinity)
        .background(.blue)
        .cornerRadius(CornerRadius.medium)
    }
}

#Preview {
    PrimaryButton(label: "On Continue", action: {
        /* Preview */
    })
    .padding(Spacing.medium)
}
