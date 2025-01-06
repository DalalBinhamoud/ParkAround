//
//  AppCoordinator.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

@MainActor
class AppCoordinator: ObservableObject {

    // MARK: - Properties
    @Published var currentView: Route = .welcome

    private(set) var applicationService = AppComponent.applicationService
    private(set) var apiService = AppComponent.apiService
    private(set) var parkingService: ParkingServiceProtocol
    private(set) var sessionManager: ActiveSessionManagerProtocol = ActiveSessionManager()

    init() {
        self.parkingService = ParkingService(serviceProvider: AppComponent.apiService)
    }
}
