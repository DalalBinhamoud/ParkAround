//
//  ReservationsHistoryViewModelProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation

protocol ReservationsHistoryViewModelProtocol: ObservableObject {
    var reservations: [ParkingReservation] { get }
    var isLoading: Bool { get }

    func onAppear() async
}
