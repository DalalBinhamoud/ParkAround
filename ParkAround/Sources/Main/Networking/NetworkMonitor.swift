//
//  NetworkMonitor.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let mointor = NWPathMonitor()
    private(set) var isConnected = true

}
