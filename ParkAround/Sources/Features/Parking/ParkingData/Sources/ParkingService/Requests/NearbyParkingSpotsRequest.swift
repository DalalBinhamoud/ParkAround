//
//  NearbyParkingSpotsRequest.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

public struct NearbyParkingSpotsRequest: ApiRequest {
    typealias ResponseType = [ParkingDetailsDTO]

    var endpoint: String { "/parking-spots" }
    var headers = [String: String]()
    var method: HTTPMethod { .get }
    var userLocation: GeoLocation

    // MARK: - Init
    init(userLocation: GeoLocation) {
        self.userLocation = userLocation
    }

}
