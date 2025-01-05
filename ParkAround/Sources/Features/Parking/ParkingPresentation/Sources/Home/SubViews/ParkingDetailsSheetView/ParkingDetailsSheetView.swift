//
//  ParkingDetailsSheetView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import SwiftUI

struct ParkingDetailsSheetView: View {
    // MARK: - Properties
    let details: ParkingDetails
    let onSelect: () -> Void

    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: Spacing.small) {
                    Text("\(details.name)")
                        .font(Fonts.heading)
                    Text("Rate: \(details.rate, specifier: "%.2f")/ 5.00")
                        .font(Fonts.subheading2)
                    Text("available Spots: \(details.availableSpots)")
                        .font(Fonts.subheading2)
                }

                Spacer()

                VStack(spacing: Spacing.large) {

                    Text(details.parkingStatus.rawValue)
                        .foregroundStyle(.white)
                        .padding(Spacing.tiny)
                        .background(details.parkingStatus.backgroundColor)
                        .cornerRadius(CornerRadius.large)
                }
            }
            .padding(.horizontal, Spacing.large)


            PrimaryButton(label: "Select & Pay", action: {
                onSelect()
            })
            .padding(.horizontal)
        }
    }
}

#Preview {
    ParkingDetailsSheetView(
        details: ParkingDetails.StubFactory.make(),
        onSelect: { /*Preview*/})
}
