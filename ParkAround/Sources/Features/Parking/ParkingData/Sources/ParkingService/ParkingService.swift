//
//  ParkingService.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

class ParkingService: ParkingServiceProtocol {

    // MARK: - Properties
    private let serviceProvider: APIServiceProtocol

    // MARK: - Init
    init(serviceProvider: any APIServiceProtocol) {
        self.serviceProvider = serviceProvider
    }

    func getNearbyParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetailsDTO] {
        let request = NearbyParkingSpotsRequest(userLocation: userLocation)
        guard let result = try await serviceProvider.sendRequest(request) else { throw ParkingServiceError.unexpectedType }
        return result
    }
}

enum ParkingServiceError: Error {
    case unexpectedType
}
