//
//  ParkingDetailsDTO.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

// suppose all attributes are required
public struct ParkingDetailsDTO: Decodable, Equatable, Sendable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case latitude
        case longitude
        case rate = "rate_per_hour"
        case availableSpots = "available_spots"
        case totalSpots = "total_spots"
    }

    let id: Int
    let name: String
    let rate: Double
    let latitude: Double
    let longitude: Double
    let availableSpots: Int
    let totalSpots: Int

    // MARK: - Init
    init(id: Int, name: String, rate: Double, latitude: Double, longitude: Double, availableSpots: Int, totalSpots: Int) {
        self.id = id
        self.name = name
        self.rate = rate
        self.latitude = latitude
        self.longitude = longitude
        self.availableSpots = availableSpots
        self.totalSpots = totalSpots
    }
}
