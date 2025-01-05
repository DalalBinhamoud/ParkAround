//
//  ParkingRepositorySpy.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation


final class ParkingRepositorySpy: ParkingRepositoryProtocol {
    // MARK: - Init
    init() { }

    var fetchParkingSpotsTasks = Task<[ParkingDetails], Error> { throw ErrorStub() }
    var fetchParkingSpotsCallsCount = 0
    func fetchParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetails] {
        fetchParkingSpotsCallsCount += 1
        return try await fetchParkingSpotsTasks.value
    }

    var processPaymentTasks = Task<Bool, Error> { throw ErrorStub() }
    var processPaymentCallsCount = 0
    func processPayment(amount: Double) async throws -> Bool {
        processPaymentCallsCount += 1
        return try await processPaymentTasks.value
    }

    var fetchReservationsHistoryTasks = Task<[ParkingReservation], Error> { throw ErrorStub() }
    var fetchReservationsHistoryCallsCount = 0
    func fetchReservationsHistory() async throws -> [ParkingReservation] {
        fetchReservationsHistoryCallsCount += 1
        return try await fetchReservationsHistoryTasks.value
    }
}
