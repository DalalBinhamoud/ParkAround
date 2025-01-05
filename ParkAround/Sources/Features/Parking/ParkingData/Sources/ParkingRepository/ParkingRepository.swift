//
//  ParkingRepository.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation
import SwiftData
import SwiftUI

final class ParkingRepository: ParkingRepositoryProtocol {

    // MARK: - Properties
    let parkingService: ParkingServiceProtocol
    @Query var reservations: [ParkingReservation]

    // MARK: - Init
    init(parkingService: ParkingServiceProtocol) {
        self.parkingService = parkingService
        _reservations = Query(sort: \.date, order: .reverse)
    }

    func fetchParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetails] {
        let response = try await parkingService.getNearbyParkingSpots(userLocation: userLocation)
        return ParkingDetailsMapper.map(from: response)
    }

    func fetchReservationsHistory() -> [ParkingReservation] {
        reservations
    }
}
