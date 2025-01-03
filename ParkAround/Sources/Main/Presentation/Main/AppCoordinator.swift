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
    private var cancellable: Set<AnyCancellable> = []

    private(set) var applicationService = AppComponent.applicationService
    private(set) var apiService = AppComponent.apiService
    private(set) var parkingService: ParkingServiceProtocol


    init() {
        self.parkingService = ParkingService(serviceProvider: AppComponent.apiService)
    }

    // MARK: - Methods
    func onAppear() {
//        // user is not allowed to explore nearby parking spots if the location is not enabled
        if !applicationService.locationManager.isLocationEnabled {
            currentView = .locationDisabled
        }
    }
}
