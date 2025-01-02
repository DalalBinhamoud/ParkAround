//
//  ParkingDetails.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

struct ParkingDetails: Hashable, Identifiable {

    let id: Int
    let name: String
    let rate: Double
    let address: GeoLocation
    let availableSpots: Int
    let totalSpots: Int

    init(id: Int, name: String, rate: Double, address: GeoLocation, availableSpots: Int, totalSpots: Int) {
        self.id = id
        self.name = name
        self.rate = rate
        self.address = address
        self.availableSpots = availableSpots
        self.totalSpots = totalSpots
    }
}
