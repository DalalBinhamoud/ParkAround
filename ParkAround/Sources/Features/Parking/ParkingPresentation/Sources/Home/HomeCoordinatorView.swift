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
                // MARK: - Header
                HStack {

                    Button(action: {
                        homeCoordinator.currentView = .favoriteParkings
                        navigationPath.append(HomeRoute.favoriteParkings)
                    }, label: {
                        Image(systemName: "heart.fill")
                    })

                    Spacer()

                    Button(action: {
                        homeCoordinator.currentView = .reservationHistory
                        navigationPath.append(HomeRoute.reservationHistory)
                    }, label: {
                        Image("reservations-history", bundle: .main)
                            .resizable()
                            .frame(width: IconSize.small, height: IconSize.small)
                    })
                }
                .padding(.horizontal)

                // MARK: - Map
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
                    EmptyView()
                case .parkingDetails(let info):
                    Text("\(info.name)")
                case .reservationHistory:
                    ReservationsHistoryView(
                        viewModel:
                            ReservationsHistoryViewModel(parkingRepository: homeCoordinator.parkingRepository)
                    )
                case .favoriteParkings:
                    FavoriteParkingsView(
                        viewModel: FavoriteParkingsViewModel(parkingRepository: homeCoordinator.parkingRepository)
                    )
                }

            }
        }
    }
}
