//
//  AlertWrapperView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import SwiftUI

struct AlertWrapperView<Content: View>: View {
    @ObservedObject private var alertManager: AlertManager
    let content: Content

    init(
        alertManager: AlertManager,
        @ViewBuilder content: () -> Content
    ) {
        self.alertManager = alertManager
        self.content = content()
    }

    var body: some View {
        ZStack {
            content

            if alertManager.isShowing {
                VStack {
                    ToastView(title: alertManager.title, message: alertManager.message)
                        .padding(.top, Spacing.giant)
                    Spacer()
                }
                .transition(.move(edge: .top).combined(with: .opacity))
                .zIndex(1)
            }
        }
//        .environmentObject(alertManager)
    }
}


extension AlertWrapperView {
    func ToastView(title: String, message: String) -> some View {
            VStack {
                Text(title)
                Text(message)
            }
            .padding()
            .background(.gray)
            .cornerRadius(CornerRadius.medium)
    }
}
