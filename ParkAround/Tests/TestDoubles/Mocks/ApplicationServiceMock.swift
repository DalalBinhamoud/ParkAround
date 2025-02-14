//
//  ApplicationServiceMock.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

final class ApplicationServiceMock: ApplicationServiceProtocol {
    var networkClient: NetworkClientProtocol = NetworkClientMock()
    var locationManager: LocationManagerProtocol = LocationManager()
}
