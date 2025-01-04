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
            Colors.background
                .ignoresSafeArea()
            content
                .padding(Spacing.large)
        }
    }
}

extension LocationDisabledView {
    @ViewBuilder private var content: some View {
        VStack(alignment: .leading, spacing: Spacing.large) {
            Spacer()
            Image("location-permission", bundle: .main)
                .resizable()
                .scaledToFit()

            Text("(Park Around) needs your location to provide you with nearby parking spots around your current location")
                .foregroundStyle(Colors.text)
                .font(Fonts.subheading)

            Text("Go to Settings and then" )
                .foregroundStyle(Colors.text)
                .font(Fonts.body)

            makeRow(imageName: "location.square.fill", title: "Select Location")
            makeRow(imageName: "checkmark.square", title: "Tap Always or While using")

            openSettings

            Spacer()
            Spacer()

        }
    }

    private var openSettings: some View {
        PrimaryButton(label: "Settings", action: {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                if urlOpener.canOpen(url) {
                    urlOpener.open(url, options: [:])
                }
            }
        })
    }

    private func makeRow(imageName: String, title: String) -> some View {
        HStack(spacing: Spacing.small) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: Constants.imageSize, height: Constants.imageSize)
                .foregroundStyle(.blue)

            Text(title)
                .foregroundStyle(Colors.text)
                .font(Fonts.body)
        }
    }

}

extension LocationDisabledView {
    private enum Constants {
        static let imageSize: CGFloat = 24
    }
}

#Preview {
    LocationDisabledView()
}
