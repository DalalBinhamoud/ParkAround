//
//  ParkingServiceProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

protocol ParkingServiceProtocol {
    func getNearbyParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetailsDTO]
}
