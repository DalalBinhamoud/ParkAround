//
//  ParkingDetailsViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation

class ParkingDetailsViewModel: ParkingDetailsViewModelProtocol {

    // MARK: - Properties
    @Published var selectedTime: Int = 1
    @Published var isLoading = false

    var totalPrice: Int {
        selectedTime * 10//TODO: parkingDetails.pricePerHour
//        selectedTime * Int(parkingDetails.rate) //TODO: parkingDetails.pricePerHour
    }

    var parkingDetails: ParkingDetails
    private var paymentRepository: PaymentRepositoryProtocol

    // MARK: - Init
    init(parkingDetails: ParkingDetails, paymentRepository: PaymentRepositoryProtocol) {
        self.parkingDetails = parkingDetails
        self.paymentRepository = paymentRepository
    }


    // MARK: - Methods
    @MainActor
    func processPayment() async {
        do {
            isLoading = true
            _ = try await paymentRepository.processPayment(amount: Double(totalPrice)) // suppose the amount is always sufficient
            isLoading = false
        } catch {
            // TODO: handle error
            isLoading = false
        }
    }
}
