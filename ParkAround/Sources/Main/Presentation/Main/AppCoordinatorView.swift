//
//  AppCoordinatorView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import SwiftUI

struct AppCoordinatorView: View {
    // MARK: - Properties
    @ObservedObject private var appCoordinator = AppCoordinator()
    @Environment(\.modelContext) var context


    // MARK: - Body
    var body: some View {
        rootView
    }
}

extension AppCoordinatorView {
    @ViewBuilder private var rootView: some View {
        switch appCoordinator.currentView {
        case .welcome:
            WelcomeView(viewModel: WelcomeViewModel(onContinue: {
                appCoordinator.currentView = .home(homeRoute: .parkings)
            }))
        case .home(let homeRoute):
            HomeCoordinatorView(
                homeCoordinator: HomeCoordinator(
                    currentView: homeRoute,
                    applicationService: appCoordinator.applicationService,
                    parkingService: appCoordinator.parkingService,
                    context: context
                ))
        case .locationDisabled:
            LocationDisabledView()
        }
    }
}

#Preview {
    AppCoordinatorView()
}
