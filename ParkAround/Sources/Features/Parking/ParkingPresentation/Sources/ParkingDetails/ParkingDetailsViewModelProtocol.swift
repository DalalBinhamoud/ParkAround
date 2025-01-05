//
//  ParkingDetailsViewModelProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation

protocol ParkingDetailsViewModelProtocol: ObservableObject {
    var selectedTime: Int { get set }
    var totalPrice: Double { get }
    var isLoading: Bool { get }
    var parkingDetails: ParkingDetails { get }

    func processPayment() async
}
