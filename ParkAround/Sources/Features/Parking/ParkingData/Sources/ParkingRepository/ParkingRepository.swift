//
//  ParkingRepository.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

final class ParkingRepository: ParkingRepositoryProtocol {
    let parkingService: ParkingServiceProtocol

    // MARK: - Init
    init(parkingService: ParkingServiceProtocol) {
        self.parkingService = parkingService
    }

    func fetchParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetails] {
        let response = try await parkingService.getNearbyParkingSpots(userLocation: userLocation)
        return ParkingDetailsMapper.map(from: response)
    }

    // Mock Payment proccess
    func processPayment(amount: Double) async throws -> Bool {

        // Simulate a delay
        try await Task.sleep(for: .seconds(Constants.mockedPaymentDuration))

        return true
    }
}

private enum  Constants {
    static let mockedPaymentDuration = 1_0000
}
