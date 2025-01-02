//
//  ApplicationServiceProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

protocol ApplicationServiceProtocol {
    var networkClient: NetworkClientProtocol { get }
    var locationManager: LocationManagerProtocol { get }
}
