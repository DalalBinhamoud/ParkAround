//
//  ParkingDetailsDTOStub.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

extension ParkingDetailsDTO {
    enum StubFactory {
        static func make(
            id: Int = 1,
            name: String = "Test Parking Spot Name",
            rate: Double = 4.0,
            costPerHour: Double = 10.0,
            latitude: Double = 24000,
            longitude: Double = 46000,
            availableSpots: Int = 12,
            totalSpots: Int = 30
        ) -> ParkingDetailsDTO {
            ParkingDetailsDTO(
                id: id,
                name: name,
                rate: rate, 
                costPerHour: costPerHour,
                latitude: latitude,
                longitude: longitude,
                availableSpots: availableSpots,
                totalSpots: totalSpots)
        }
    }
}
