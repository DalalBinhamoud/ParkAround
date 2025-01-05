//
//  NetworkMonitor.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation
import Network

@Observable
final class NetworkMonitor {
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false
    var showAlert = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied

            if !self.isConnected {
                self.showAlert = true
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
