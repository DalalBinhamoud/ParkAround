//
//  PaymentRepository.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation

class PaymentRepository: PaymentRepositoryProtocol {
    // Mock Payment proccess
    func processPayment(amount: Double) async throws -> Bool {

        // Simulate a delay
        try await Task.sleep(for: .seconds(Constants.mockedPaymentDuration))

        return true
    }
}

private enum  Constants {
    static let mockedPaymentDuration = 3
}
