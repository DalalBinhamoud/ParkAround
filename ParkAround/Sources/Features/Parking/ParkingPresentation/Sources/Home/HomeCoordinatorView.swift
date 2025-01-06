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
    @Environment(\.modelContext) private var modelContext
    @State private var searchQuery = ""

    // MARK: - Init
    init(homeCoordinator: HomeCoordinator) {
        self.homeCoordinator = homeCoordinator
    }

    // MARK: - Body
    var body: some View {
        NavigationStack(path: $homeCoordinator.navigationPath) {
            ZStack {
                Colors.backgroundMedium
                    .ignoresSafeArea()
                VStack {
                    // MARK: - Header
                    HStack {

                        Button(action: {
                            homeCoordinator.navigateTo(HomeRoute.favoriteParkings)
                        }, label: {
                            Image(systemName: "heart.fill")
                        })

                        ParkingSearchView(searchQuery: $searchQuery)
                            .padding(.vertical)

                        Button(action: {
                            homeCoordinator.navigateTo(HomeRoute.reservationHistory)
                        }, label: {
                            Image("reservations-history", bundle: .main)
                                .resizable()
                                .foregroundStyle(Colors.primary)
                                .frame(width: IconSize.small, height: IconSize.small)
                        })
                    }
                    .padding(.horizontal)

                    RemainingTimeView(viewModel: RemainingTimeViewModel(sessionManager: homeCoordinator.sessionManager))

                    // MARK: - Map
                    ParkingSpotsMapView(
                        searchQuery: $searchQuery,
                        viewModel: ParkingSpotsMapViewModel(
                            applicationService: homeCoordinator.applicationService,
                            parkingRepository: homeCoordinator.parkingRepository,
                            paymentRepository: homeCoordinator.paymentRepository,
                            sessionManager: homeCoordinator.sessionManager,
                            modelContext: modelContext
                        )

                    )
                    .navigationDestination(for: HomeRoute.self) { route in
                        switch route {
                        case .parkings:
                            EmptyView()
                        case .parkingDetails(let info): // TODO: after navigation enhancement
                            ParkingDetailsView(
                                viewModel: ParkingDetailsViewModel(
                                    parkingDetails: info,
                                    parkingRepository: homeCoordinator.parkingRepository,
                                    paymentRepository: homeCoordinator.paymentRepository,
                                    sessionManager: homeCoordinator.sessionManager
                                )
                            )
                            //                            {
                            //                                homeCoordinator.navigationPath.removeLast()
                            //                            }
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
    }
}
