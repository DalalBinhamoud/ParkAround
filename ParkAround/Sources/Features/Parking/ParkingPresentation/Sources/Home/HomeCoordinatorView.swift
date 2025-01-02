//
//  HomeCoordinatorView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import SwiftUI

struct HomeCoordinatorView: View {
    // MARK: - Properties
    @ObservedObject private var homeCoordinator: HomeCoordinator

    // MARK: - Init
    init(homeCoordinator: HomeCoordinator) {
        self.homeCoordinator = homeCoordinator
    }

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Coordinator")
                ParkingSpotsMapView(
                    viewModel: ParkingSpotsMapViewModel(
                        applicationService: homeCoordinator.applicationService,
                        repository: homeCoordinator.parkingRepository
                    )
                )
            }
        }
        .navigationDestination(for: HomeRoute.self) { route in
            switch route {
            case .parkings:
                Text("parkings")
            case .parkingDetails(let info):
                Text("\(info.name)")
            case .history:
                Text("history")
            case .favorites:
                Text("favorites")
            }

        }
    }
}

//#Preview {
//    HomeCoordinatorView()
//}
