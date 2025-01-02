//
//  ParkingDetailsMapper.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

class ParkingDetailsMapper {
    static func map(from dto: ParkingDetailsDTO) -> ParkingDetails {
        return ParkingDetails(
            id: dto.id,
            name: dto.name,
            rate: dto.rate,
            address: GeoLocation(latitude: dto.latitude, longitude: dto.longitude),
            availableSpots: dto.availableSpots,
            totalSpots: dto.totalSpots
        )
    }

    static func map(from dtos: [ParkingDetailsDTO]) -> [ParkingDetails] {
        return dtos.compactMap {
            map(from: $0)
        }
    }
}
