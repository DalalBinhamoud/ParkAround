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
    @State var navigationPath = NavigationPath()
    @Environment(\.modelContext) private var modelContext

    // MARK: - Init
    init(homeCoordinator: HomeCoordinator) {
        self.homeCoordinator = homeCoordinator
    }

    // MARK: - Body
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                HStack {
                    Text("Header")
                    Button(action: {
                        homeCoordinator.currentView = .history
                        navigationPath.append(HomeRoute.history)
                    }, label: {
                        Text("Go to history")
                    })
                }

                ParkingSpotsMapView(
                    viewModel: ParkingSpotsMapViewModel(
                        applicationService: homeCoordinator.applicationService,
                        parkingRepository: homeCoordinator.parkingRepository,
                        paymentRepository: homeCoordinator.paymentRepository,
                        modelContext: modelContext
                    )
                )
            }
            .navigationDestination(for: HomeRoute.self) { route in
                switch route {
                case .parkings:
                    Text("parkings")
                case .parkingDetails(let info):
                    Text("\(info.name)")
                case .history:
                    ReservationsHistoryView(
                        viewModel:
                            ReservationsHistoryViewModel(parkingRepository: homeCoordinator.parkingRepository)
                    )
                case .favorites:
                    Text("favorites")
                }

            }
        }
    }
}

// TODO: Add Fixture
//#Preview {
//    HomeCoordinatorView()
//}
