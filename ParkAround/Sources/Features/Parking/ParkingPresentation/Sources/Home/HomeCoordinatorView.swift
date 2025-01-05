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
                    
                    // MARK: - Map
                    ParkingSpotsMapView(
                        searchQuery: $searchQuery,
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
}
