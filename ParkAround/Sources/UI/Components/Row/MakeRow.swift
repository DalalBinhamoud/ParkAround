//
//  MakeRow.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import SwiftUI

struct MakeRow: View {

    // MARK: - Properties
    let imageName: String
    let title: String

    // MARK: - Body
    var body: some View {
        HStack(spacing: Spacing.small) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: IconSize.small, height: IconSize.small)
            //                .foregroundStyle(Colors.primary)

            Text(title)
                .font(Fonts.body)
        }
    }
}

#Preview {
    MakeRow(imageName: "star.fill", title: "4.00/ 5.00")
}
