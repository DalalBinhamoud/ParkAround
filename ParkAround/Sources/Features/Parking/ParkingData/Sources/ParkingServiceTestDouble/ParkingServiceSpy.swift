//
//  ParkingServiceSpy.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation


public final class ParkingServiceSpy: ParkingServiceProtocol {

    var getNearbyParkingSpotsTask = Task<[ParkingDetailsDTO], Error> { throw ErrorStub() }
    var getNearbyParkingSpotsCallsCount = 0
    func getNearbyParkingSpots(userLocation: GeoLocation) async throws -> [ParkingDetailsDTO] {
        getNearbyParkingSpotsCallsCount += 1
        return try await getNearbyParkingSpotsTask.value
    }
    

}
