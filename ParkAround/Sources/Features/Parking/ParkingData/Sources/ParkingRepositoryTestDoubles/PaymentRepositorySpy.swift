//
//  PaymentReposiorySpy.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation

final class PaymentRepositorySpy: PaymentRepositoryProtocol {
    var processPaymentTask = Task<Bool, Error> { throw ErrorStub() }
    var processPaymentCallsCount = 0
    func processPayment(amount: Double) async throws -> Bool {
        processPaymentCallsCount += 1
        return try await processPaymentTask.value
    }
}
