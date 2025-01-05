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
    @Query var favoriteParkings: [FavoriteParking]
    var context: ModelContext

    // MARK: - Init
    init(
        parkingService: ParkingServiceProtocol,
        context: ModelContext
    ) {
        self.parkingService = parkingService
        self.context = context
        _reservations = Query(sort: \.date, order: .reverse)
        _favoriteParkings = Query(sort: \.date, order: .reverse)
    }

    func fetchParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetails] {
        let response = try await parkingService.getNearbyParkingSpots(userLocation: userLocation)
        return ParkingDetailsMapper.map(from: response)
    }

    // MARK: - Parking Reservation
    func fetchReservationsHistory() -> [ParkingReservation] {
        reservations
    }

    func addReservation(for parkingDetails: ParkingDetails, totalPrice: Double, selectedTime: Int) {
        let newReservation = ParkingReservation(address: parkingDetails.address, cost: totalPrice, date: Date(), duration: selectedTime * 60)
        context.insert(newReservation)
        do {
            try context.save()
        } catch {
            fatalError("Failed to save the new data \(error)")
        }
    }

    // MARK: - Parking Favorites
    func fetchFavoriteParkings() -> [FavoriteParking] {
        favoriteParkings
    }

    func addToFavorite(parkingDetails: ParkingDetails) {
        // TODO: map
        let newParkingDetails = ParkingDetailsClass(
            name: parkingDetails.name, rate: parkingDetails.rate, costPerHour: parkingDetails.costPerHour, availableSpots: parkingDetails.availableSpots, totalSpots: parkingDetails.totalSpots)
        let newFavoriteLocation = FavoriteParking(parkingDetails: newParkingDetails)

        context.insert(newFavoriteLocation)

        do {
            try context.save()
        } catch {
            fatalError("Failed to save the new data \(error)")
        }
    }
}
