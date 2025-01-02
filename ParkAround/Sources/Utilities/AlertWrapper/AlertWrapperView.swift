//
//  AlertWrapperView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import SwiftUI

struct AlertWrapperView<Content: View>: View {

    // MARK: - Properties
    @ViewBuilder private var content: () -> Content
    @ObservedObject private var viewModel: AlertWrapperViewModel

    // MARK: - Init
    init(
        viewModel: AlertWrapperViewModel,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.content = content
    }

    // MARK: - Body
    var body: some View {
        content()
            .overlay {
                if viewModel.showToast {
                    toastAlertView
                }
            }
    }
}

extension AlertWrapperView {
    @ViewBuilder private var toastAlertView: some View {
        HStack {
            if let icon = viewModel.icon {
                icon
                    .resizable()
                    .frame(width: Constants.iconSize, height: Constants.iconSize)
            }

            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text(viewModel.description)
                    .font(.body)
            }

        }
        .padding()
        .background(Colors.background)
        .cornerRadius(CornerRadius.medium)
        .transition(.move(edge: .top).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                viewModel.showToast = false
            }
        }
    }
}

private enum Constants {
    static let iconSize: CGFloat = 50
}

//#Preview {
//    AlertWrapperView(
//        viewModel: AlertWrapperViewModel(
//            showToast: true,
//            title: "test",
//            description: "test Description",
//            icon: Image(systemName: "info.circle")
//        )
//    )
//}
