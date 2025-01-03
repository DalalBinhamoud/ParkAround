//
//  LocationManagerProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import CoreLocation
import Foundation

protocol LocationManagerProtocol: AnyObject {
    var isLocationEnabled: Bool { get }
    var lastLocation: GeoLocation? { get }

    func requestWhenInUseAuthorization() async -> CLAuthorizationStatus
}
