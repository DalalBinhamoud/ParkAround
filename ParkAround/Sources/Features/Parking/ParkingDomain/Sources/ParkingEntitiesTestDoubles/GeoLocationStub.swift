//
//  GeoLocationStub.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

extension GeoLocation {
    enum StubFactory {
        static func make(
            latitude: Double = 1.1,
            longitude: Double = 1.1
        ) -> GeoLocation {
            GeoLocation(
                latitude: latitude,
                longitude: longitude
            )
        }
    }
}
