//
//  WelcomeView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import SwiftUI

struct WelcomeView<ViewModel> : View where ViewModel: WelcomeViewModelProtocol {

    // MARK: - Properties
    @ObservedObject private var viewModel: ViewModel

    // MARK: - Init
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        ZStack {

            Colors.backgroundMedium
                .ignoresSafeArea()

            VStack(spacing: Spacing.large) {
                Image("logo", bundle: .main)
                    .resizable()
                    .scaledToFit()
                    .padding(Spacing.medium)


                Text("Find nearby paid parking and details you need at your fingertips!")
                    .foregroundStyle(Colors.text)
                    .font(Fonts.heading)
                    .lineSpacing(Spacing.small)


                Spacer()

                PrimaryButton(label: "Let's Start", action: {
                    viewModel.onContinue()
                })

            }
         
            .padding(Spacing.large)
        }
    }
}

// MARK: - ViewIdentifiers
extension WelcomeView {
    private typealias ViewIdentifiers = WelcomeViewIdentifiers
}

private enum WelcomeViewIdentifiers {

    enum Button {
        static let onContinue = "button_onContinue"
    }
    enum Icon {
        static let logo = "icon_logo"
    }

    enum Text {
        static let slogan = "text_slogan"
    }

    static let view = "welcomeView"
}

#Preview {
    class ViewModelFixture: WelcomeViewModelProtocol {
        var onContinue = { }
    }
    return WelcomeView(
        viewModel: ViewModelFixture()
    )
}
