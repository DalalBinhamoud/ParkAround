//
//  ParkingSpotsMapViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

class ParkingSpotsMapViewModel: ParkingSpotsMapViewModelProtocol {

    // MARK: - Properties
    @Published var isLoading = false
    @Published var parkingSpots: [ParkingDetails] = []
    let applicationService: ApplicationService
    let repository: ParkingRepositoryProtocol

    // MARK: - Init
    init(
        applicationService: ApplicationService,
        repository: ParkingRepositoryProtocol
    ) {
        self.applicationService = applicationService
        self.repository = repository
    }

    @MainActor
    func onAppear() async {
        do {
            isLoading = true
            parkingSpots = try await repository.fetchParkingSpots(userLocation: applicationService.locationManager.lastLocation ?? GeoLocation(latitude: 24000, longitude: 46000))
            isLoading = false
        } catch {
            isLoading = true
        }
    }
}
