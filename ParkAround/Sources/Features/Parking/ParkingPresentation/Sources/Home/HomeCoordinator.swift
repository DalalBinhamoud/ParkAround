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
    @Published private(set) var  sessionManager: ActiveSessionManagerProtocol
    @Published private(set) var parkingRepository: ParkingRepositoryProtocol
    @Published private(set) var paymentRepository: PaymentRepository
    private(set) var parkingService: ParkingServiceProtocol?
    @Published var navigationPath = NavigationPath()


    // MARK: - Init
    init(
        currentView: HomeRoute,
        applicationService: ApplicationService,
        sessionManager: ActiveSessionManagerProtocol,
        parkingService: ParkingServiceProtocol,
        context: ModelContext
    ) {
        self.currentView = currentView
        self.applicationService = applicationService
        self.sessionManager = sessionManager
        self.parkingRepository = ParkingRepository(
            parkingService: parkingService,
            context: context
        )
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
