//
//  ParkingDetailsStub.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

extension ParkingDetails {
    enum StubFactory {
        static func make(
            id: Int = 1,
            name: String = "Test Parking Spot Name",
            rate: Double = 4.0,
            address: GeoLocation = GeoLocation.StubFactory.make(),
            availableSpots: Int = 12,
            totalSpots: Int = 30
        ) -> ParkingDetails {
            ParkingDetails(
                id: id,
                name: name,
                rate: rate,
                address: address,
                availableSpots: availableSpots,
                totalSpots: totalSpots)
        }
    }
}
