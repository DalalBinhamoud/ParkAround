//
//  LocationDisabledView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import SwiftUI

struct LocationDisabledView: View {

    // MARK: - Properties
    private let urlOpener: URLOpener = UIApplication.shared

    // MARK: - Body
    var body: some View {
        ZStack {
            Colors.backgroundMedium
                .ignoresSafeArea()
            content
                .padding(Spacing.large)
        }
    }
}

extension LocationDisabledView {
    @ViewBuilder private var content: some View {
        VStack(alignment: .center, spacing: Spacing.medium) {
            Image("location-permission", bundle: .main)
                .resizable()
                .scaledToFit()
                .frame(width: IconSize.large, height: IconSize.large)
                .padding(.top, Spacing.giant)
                .accessibilityIdentifier(ViewIdentifiers.Icon.location)

            Text("Enable Location Services")
                .foregroundStyle(Colors.text)
                .font(Fonts.heading)
                .accessibilityIdentifier(ViewIdentifiers.Text.title)

            Text(getRichDescription(of: "Park Around needs your location to provide you with nearby parking spots around your current location.", highlightedText: "Park Around"))
                .lineSpacing(Spacing.tiny)
                .foregroundStyle(Colors.text)
                .font(Fonts.body)
                .accessibilityIdentifier(ViewIdentifiers.Text.description)

            Spacer()
            openSettings
        }
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(ViewIdentifiers.view)
    }

    private var openSettings: some View {
        PrimaryButton(label: "Enable Location", action: {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                if urlOpener.canOpen(url) {
                    urlOpener.open(url, options: [:])
                }
            }
        })
        .accessibilityIdentifier(ViewIdentifiers.Button.enableLocation)
    }

    private func getRichDescription(of text: String, highlightedText: String) -> AttributedString {
        var attributedString = AttributedString(text)

        if let range = attributedString.range(of: highlightedText) {
            attributedString[range].font = Fonts.subheading
        }
        return attributedString
    }

}

// MARK: - ViewIdentifiers
extension LocationDisabledView {
    private typealias ViewIdentifiers = LocationDisabledViewIdentifiers
}

private enum LocationDisabledViewIdentifiers {

    enum Button {
        static let enableLocation = "button_enableLocation"
    }
    enum Icon {
        static let location = "icon_location"
    }

    enum Text {
        static let title = "text_enableLocation"
        static let description = "text_enableLocationDescription"

    }

    static let view = "locationDisabledView"
}

#Preview {
    LocationDisabledView()
}
