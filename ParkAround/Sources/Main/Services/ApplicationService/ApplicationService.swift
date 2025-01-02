//
//  ApplicationService.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

// TODO: needed?
class ApplicationService: ObservableObject, ApplicationServiceProtocol {

    @Published var networkClient: NetworkClientProtocol
    @Published var locationManager: LocationManagerProtocol

    init(networkClient: NetworkClientProtocol, locationManager: LocationManagerProtocol) {
        self.networkClient = networkClient
        self.locationManager = locationManager
    }
}
