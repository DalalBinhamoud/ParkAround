//
//  InlineButton.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import SwiftUI

struct InlineButton: View {

    // MARK: - Properties
    private let label: String
    private let background: Color
    private let action: () -> Void

    // MARK: - Init
    init(
        label: String,
        background: Color = Colors.primary,
        action: @escaping () -> Void) {
        self.label = label
        self.background = background
        self.action = action
    }

    // MARK: - Body
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(label)
                .foregroundStyle(.white)
                .font(Fonts.subheading)
                .padding(Spacing.medium)
        })
        .background(background)
        .cornerRadius(CornerRadius.medium)
    }
}

#Preview {
    InlineButton(
        label: "Press",
        action: {
        /* Preview */
    })
}
