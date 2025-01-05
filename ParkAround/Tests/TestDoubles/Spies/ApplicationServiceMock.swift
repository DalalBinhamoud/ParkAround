//
//  ApplicationServiceMock.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation


final class ApplicationServiceMock: ApplicationServiceProtocol {
    var networkClient: NetworkClientProtocol = NetworkClientMock()

    var locationManager: LocationManagerProtocol = LocationManager()


}
