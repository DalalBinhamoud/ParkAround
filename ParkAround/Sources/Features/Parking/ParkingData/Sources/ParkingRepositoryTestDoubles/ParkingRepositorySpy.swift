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

    var fetchParkingSpotsTask = Task<[ParkingDetails], Error> { throw ErrorStub() }
    var fetchParkingSpotsCallsCount = 0
    func fetchParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetails] {
        fetchParkingSpotsCallsCount += 1
        return try await fetchParkingSpotsTask.value
    }

    // MARK: Parking Reservation
    var fetchReservationsHistoryTask = Task<[ParkingReservation], Error> { throw ErrorStub() }
    var fetchReservationsHistoryCallsCount = 0
    func fetchReservationsHistory() async throws -> [ParkingReservation] {
        fetchReservationsHistoryCallsCount += 1
        return try await fetchReservationsHistoryTask.value
    }


    var addReservationCallsCount = 0
    func addReservation(for parkingDetails: ParkingDetails, totalPrice: Double, selectedTime: Int) {
        addReservationCallsCount += 1
    }


    // MARK: Favorite Parking
    var fetchFavoriteParkingsTask = Task<[FavoriteParking],Error> { throw ErrorStub() }
    var fetchFavoriteParkingsCallsCount = 0
    func fetchFavoriteParkings() async throws -> [FavoriteParking] {
        fetchFavoriteParkingsCallsCount += 1
        return try await fetchFavoriteParkingsTask.value
    }

    var addToFavoriteCallsCount = 0
    func addToFavorite(parkingDetails: ParkingDetails) {
        addToFavoriteCallsCount += 1
    }

}
