//
//  PaymentRepositoryProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation

protocol PaymentRepositoryProtocol {
    func processPayment(amount: Double) async throws -> Bool 
}
