//
//  GeoLocation.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

struct GeoLocation2: Codable, Hashable { // Hashable, Sendable, 
    let latitude: Double
    let longitude: Double

    // MARK: - Init
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
