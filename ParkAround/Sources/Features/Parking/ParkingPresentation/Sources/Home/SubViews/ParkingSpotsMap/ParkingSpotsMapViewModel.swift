//
//  ParkingSpotsMapViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation
import MapKit

class ParkingSpotsMapViewModel: ParkingSpotsMapViewModelProtocol {

    // MARK: - Properties
    @Published var isLoading = false
    @Published var parkingSpots: [ParkingDetails] = []
    let applicationService: ApplicationService
    let parkingRepository: ParkingRepositoryProtocol
    let paymentRepository: PaymentRepositoryProtocol

    // MARK: - Init
    init(
        applicationService: ApplicationService,
        parkingRepository: ParkingRepositoryProtocol,
        paymentRepository: PaymentRepositoryProtocol
    ) {
        self.applicationService = applicationService
        self.parkingRepository = parkingRepository
        self.paymentRepository = paymentRepository
    }

    // MARK: - Methods
    @MainActor
    func onAppear() async {
        do {
            isLoading = true
            parkingSpots = try await parkingRepository.fetchParkingSpots(userLocation: applicationService.locationManager.lastLocation ?? GeoLocation(latitude: 24000, longitude: 46000))
            isLoading = false
        } catch {
            isLoading = true
        }
    }
}
