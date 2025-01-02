//
//  ParkingSpotDetailsRequest.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

struct ParkingSpotDetailsRequest: ApiRequest {
    typealias ResponseType = ParkingDetailsDTO

    var endpoint: String { "/parking-spots/\(id)" }
    var headers = [String: String]()
    var method: HTTPMethod { .get }

    var id: String

    // MARK: - Init
    init(id: String) {
        self.id = id
    }

}
