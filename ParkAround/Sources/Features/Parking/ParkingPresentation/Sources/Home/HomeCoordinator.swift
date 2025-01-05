//
//  HomeCoordinator.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation
import SwiftData
import SwiftUI

class HomeCoordinator: ObservableObject {
    // MARK: - Properties
    @Published var currentView: HomeRoute
    @Published private(set) var applicationService: ApplicationService
    @Published private(set) var parkingRepository: ParkingRepositoryProtocol
    @Published private(set) var paymentRepository: PaymentRepository
    private(set) var parkingService: ParkingServiceProtocol?
    @Published var navigationPath = NavigationPath()


    // MARK: - Init
    init(
        currentView: HomeRoute,
        applicationService: ApplicationService,
        parkingService: ParkingServiceProtocol,
        context: ModelContext
    ) {
        self.currentView = currentView
        self.applicationService = applicationService
        self.parkingRepository = ParkingRepository(parkingService: parkingService)
        self.paymentRepository = PaymentRepository()
    }

    // TODO: decouple functionality and move to dedicated routing controlling class
    func navigateTo(_ route: HomeRoute) {
        currentView = route
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
        navigationPath.append(route)
    }
}
