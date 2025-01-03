//
//  LocationManager.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject, LocationManagerProtocol {

    // MARK: - Properties
    @Published private(set) var lastLocation: GeoLocation?
    @Published private(set) var isLocationEnabled = false
    var manager = CLLocationManager()

    override init() {
        super.init()
        checkLocationAuthorization()
    }

    func checkLocationAuthorization() {

        manager.delegate = self
        manager.startUpdatingLocation()

        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            lastLocation = GeoLocation(latitude: manager.location?.coordinate.latitude ?? 0, longitude: manager.location?.coordinate.longitude ?? 0)
            isLocationEnabled = true
        case .denied, .restricted:
            isLocationEnabled = false
        @unknown default:
            isLocationEnabled = false
        }
    }

    @MainActor
    func requestWhenInUseAuthorization() async -> CLAuthorizationStatus {
        guard manager.authorizationStatus == .notDetermined else { return manager.authorizationStatus }
        self.manager.requestWhenInUseAuthorization()
        return manager.authorizationStatus
    }

}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
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
