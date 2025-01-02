//
//  LocationManagerMock.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import CoreLocation

class LocationManagerMock: LocationManagerProtocol {
    var isLocationEnabled: Bool
    var authorizationStatus: CLAuthorizationStatus
    var lastLocation: GeoLocation?

    // MARK: - Init
    init(
        isLocationEnabled: Bool = true,
        authorizationStatus: CLAuthorizationStatus = .authorizedWhenInUse,
        lastLocation: GeoLocation? = nil
    ) {
        self.authorizationStatus = authorizationStatus
        self.lastLocation = lastLocation
        self.isLocationEnabled = isLocationEnabled
    }

    func requestWhenInUseAuthorization() async -> CLAuthorizationStatus {
        authorizationStatus
    }
}
