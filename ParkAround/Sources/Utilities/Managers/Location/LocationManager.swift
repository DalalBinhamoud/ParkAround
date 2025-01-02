//
//  LocationManager.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, LocationManagerProtocol {

    // MARK: - Properties
    @Published private(set) var authorizationStatus = CLAuthorizationStatus.notDetermined
    @Published private(set) var lastLocation: GeoLocation?


    var isLocationEnabled: Bool {
        authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse
    }



    private var authorizationContinuation: CheckedContinuation<CLAuthorizationStatus, Never>?

    @MainActor private lazy var manager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()

    @MainActor
    func requestWhenInUseAuthorization() async -> CLAuthorizationStatus {
        guard manager.authorizationStatus == .notDetermined else { return manager.authorizationStatus }

        return await withCheckedContinuation { [weak self] continuation in
            self?.authorizationContinuation = continuation
            self?.manager.requestWhenInUseAuthorization()

        }
    }

}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        authorizationContinuation?.resume(returning: manager.authorizationStatus)
        authorizationContinuation = nil
        guard [.authorizedWhenInUse, .authorizedAlways].contains(authorizationStatus) else { return }
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate = locations.last?.coordinate
        lastLocation = coordinate.map {
            GeoLocation(latitude: $0.latitude, longitude: $0.longitude)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // TODO: log error
        print(error)
    }
}
