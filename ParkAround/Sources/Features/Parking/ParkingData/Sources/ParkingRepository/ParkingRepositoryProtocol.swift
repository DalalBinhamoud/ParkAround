//
//  ParkingRepositoryProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

protocol ParkingRepositoryProtocol {
    func fetchParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetails]
    func fetchReservationsHistory() async throws -> [ParkingReservation]
}
