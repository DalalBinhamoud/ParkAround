//
//  ParkingDetailsViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation
import SwiftData
import SwiftUI

class ParkingDetailsViewModel: ParkingDetailsViewModelProtocol {

    // MARK: - Properties
    @Published var selectedTime: Int = 1
    @Published var isLoading = false
    private var context: ModelContext?
    private let sessionManager: ActiveSessionManagerProtocol = ActiveSessionManager()

    var totalPrice: Double {
        Double(selectedTime) * parkingDetails.costPerHour
    }


    var parkingDetails: ParkingDetails
    private var paymentRepository: PaymentRepositoryProtocol

    // MARK: - Init
    init(parkingDetails: ParkingDetails, paymentRepository: PaymentRepositoryProtocol, context: ModelContext? = nil) {
        self.parkingDetails = parkingDetails
        self.paymentRepository = paymentRepository
        self.context = context
    }


    // MARK: - Methods
    @MainActor
    func processPayment() async {
        do {
            isLoading = true
            _ = try await paymentRepository.processPayment(amount: Double(totalPrice)) // suppose the amount is always sufficient
            isLoading = false
            sessionManager.startSession(duration: TimeInterval(((selectedTime * 60) * 60)))
            addReservation()

        } catch {
            // TODO: handle error
            isLoading = false
        }
    }

    private func addReservation() {
            let newReservation = ParkingReservation(address: parkingDetails.address, cost: totalPrice, date: Date(), duration: selectedTime * 60)
            context?.insert(newReservation)
            do {
                try context?.save()
            } catch {
                fatalError("Failed to save the new data \(error)")
            }
    }
}
