//
//  PrimaryButton.swift
//  ParkAround
//
//  Created by Dalal Macbook on 02/01/2025.
//

import SwiftUI

struct PrimaryButton: View {

    // MARK: - Properties
    private let label: String
    private var isDisabled = false
    private let action: () -> Void

    // MARK: - Init
    init(
        label: String,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.isDisabled = isDisabled
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
        .frame(maxWidth: .infinity)
        .background(isDisabled ? Colors.primary.opacity(0.4) : Colors.primary)
        .cornerRadius(CornerRadius.medium)
    }
}

#Preview {
    PrimaryButton(label: "On Continue", action: {
        /* Preview */
    })
    .padding(Spacing.medium)
}
