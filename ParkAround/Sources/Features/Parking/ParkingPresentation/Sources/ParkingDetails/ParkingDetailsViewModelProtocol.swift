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
    var isButtonDisabled: Bool { get }
    var isAlertVisible: Bool { get set }
    var parkingDetails: ParkingDetails { get }

    var alertContent: AlertContent { get }

    func addToFavorite()
    func getRateIcon() -> String
    func processPayment() async

}
