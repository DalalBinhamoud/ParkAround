//
//  AppComponent.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

enum AppComponent {

    // private
    private static let locationManager = LocationManager()
    private static var networkClient : NetworkClientProtocol {
//        NetworkClient()
        MockedNetworkClient()
    }

    static let applicationService = ApplicationService(
        networkClient: networkClient,
        locationManager: locationManager
    )

    static let apiService = APIService(locationProvider: locationManager)

//    static let ParkingService = ParkingService(
//        serviceProvider: applicationService
//    )
}
