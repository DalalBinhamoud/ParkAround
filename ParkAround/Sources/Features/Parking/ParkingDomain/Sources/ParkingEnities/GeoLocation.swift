//
//  GeoLocation.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation
struct GeoLocation: Codable, Hashable {
    let latitude: Double
    let longitude: Double

    // MARK: - Init
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}