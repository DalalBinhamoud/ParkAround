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
    var modelContext: ModelContext?
//    private let onNavigate: (_ parkingDetails: ParkingDetails) -> Void

    // MARK: - Init
    init(
        applicationService: ApplicationServiceProtocol,
        parkingRepository: ParkingRepositoryProtocol,
        paymentRepository: PaymentRepositoryProtocol,
        modelContext: ModelContext? = nil
//        onNavigate: @escaping (_ parkingDetails: ParkingDetails) -> Void
    ) {
        self.applicationService = applicationService
        self.parkingRepository = parkingRepository
        self.paymentRepository = paymentRepository
        self.modelContext = modelContext
//        self.onNavigate = onNavigate
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
