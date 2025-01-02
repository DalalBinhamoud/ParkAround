//
//  HomeCoordinator.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

class HomeCoordinator: ObservableObject {
    // MARK: - Properties
    @Published private(set) var currentView: HomeRoute
    @Published private(set) var applicationService: ApplicationService
    @Published private(set) var parkingRepository: ParkingRepositoryProtocol
    private(set) var parkingService: ParkingServiceProtocol?

    // MARK: - Init
    init(
        currentView: HomeRoute,
        applicationService: ApplicationService,
        parkingService: ParkingServiceProtocol) {
        self.currentView = currentView
        self.applicationService = applicationService
        self.parkingRepository = ParkingRepository(parkingService: parkingService)
    }

    // MARK: - Methods
    func navigateToParkingDetails(parkingDetails: ParkingDetails) {
        currentView = .parkingDetails(info: parkingDetails)
    }
}
