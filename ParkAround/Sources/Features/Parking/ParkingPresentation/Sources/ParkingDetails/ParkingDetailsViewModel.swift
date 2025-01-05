//
//  ParkingDetailsViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation
import SwiftUI

class ParkingDetailsViewModel: ParkingDetailsViewModelProtocol {

    // MARK: - Properties
    @Published var selectedTime: Int = 1
    @Published var isLoading = false
    @Published var isAlertVisible = false

    var isButtonDisabled: Bool {
        parkingDetails.parkingStatus == .occupied || isLoading
    }

    private let sessionManager: ActiveSessionManagerProtocol = ActiveSessionManager()
    var alertContent = AlertContent(title: "", message: "")

    var totalPrice: Double {
        Double(selectedTime) * parkingDetails.costPerHour
    }


    var parkingDetails: ParkingDetails
    private var paymentRepository: PaymentRepositoryProtocol
    private var parkingRepository: ParkingRepositoryProtocol

    // MARK: - Init
    init(
        parkingDetails: ParkingDetails,
        parkingRepository: ParkingRepositoryProtocol,
        paymentRepository: PaymentRepositoryProtocol
        ) {
        self.parkingDetails = parkingDetails
        self.parkingRepository = parkingRepository
        self.paymentRepository = paymentRepository
    }

    // TODO: avoid breaking SRP
    // MARK: - Methods
    func getRateIcon() -> String {
        switch parkingDetails.rate {
        case 5:
            return "star.fill"
        case 3..<5:
            return "star.leadinghalf.filled"
        default:
            return "star"
        }
    }

    // MARK: - Parking Reservation
    func addToFavorite() {
        parkingRepository.addToFavorite(parkingDetails: parkingDetails)
    }

    // MARK: - Parking Reservation
    func addReservation() { // private
        parkingRepository.addReservation(for: parkingDetails, totalPrice: totalPrice, selectedTime: selectedTime)
    }

    // MARK: - Payment
    @MainActor
    func processPayment() async {
        do {
            isLoading = true
            _ = try await paymentRepository.processPayment(amount: Double(totalPrice)) // suppose the amount is always sufficient
            isLoading = false
            sessionManager.startSession(duration: TimeInterval(((selectedTime * 60) * 60)))
            addReservation()

            alertContent = AlertContent(title: "Success", message: "Reservation has been done successfully")
            isAlertVisible = true

        } catch {
            isLoading = false
            alertContent = AlertContent(title: "Error", message: "Failed to pay")
            isAlertVisible = true

        }
    }
}
