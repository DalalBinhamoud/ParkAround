//
//  ParkingSpotsMapViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation
import MapKit
import SwiftData

class ParkingSpotsMapViewModel: ParkingSpotsMapViewModelProtocol {

    // MARK: - Properties
    @Published var isLoading = false
    @Published var parkingSpots: [ParkingDetails] = []
    let applicationService: ApplicationServiceProtocol
    let parkingRepository: ParkingRepositoryProtocol
    let paymentRepository: PaymentRepositoryProtocol
    var sessionManager: ActiveSessionManagerProtocol
    var modelContext: ModelContext?

    // MARK: - Init
    init(
        applicationService: ApplicationServiceProtocol,
        parkingRepository: ParkingRepositoryProtocol,
        paymentRepository: PaymentRepositoryProtocol,
        sessionManager: ActiveSessionManagerProtocol,
        modelContext: ModelContext? = nil
    ) {
        self.applicationService = applicationService
        self.parkingRepository = parkingRepository
        self.paymentRepository = paymentRepository
        self.sessionManager = sessionManager
        self.modelContext = modelContext
    }

    // MARK: - Methods
    @MainActor
    func onAppear() async {
        do {
            isLoading = true
            parkingSpots = try await parkingRepository.fetchParkingSpots(userLocation: applicationService.locationManager.lastLocation ?? GeoLocation(latitude: 24000, longitude: 46000))
            isLoading = false
        } catch {
            isLoading = false
        }
    }

    // custom marker based on parking spots availability
    func getParkingMarker(for status: ParkingStatus) -> String {
        switch status {
        case .available:
            return "park-marker-available"
        case .busy:
            return "park-marker-busy"
        case .occupied:
            return "park-marker-occupied"
        }
    }

//    func navigateToDisplayDetails(for parkingDetails: ParkingDetails) {
//        onNavigate(parkingDetails)
//    }
}
