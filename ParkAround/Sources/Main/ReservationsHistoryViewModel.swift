//
//  ReservationsHistoryViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation


class ReservationsHistoryViewModel: ReservationsHistoryViewModelProtocol {

    // MARK: - Properties
    var reservations: [ParkingReservation] = []
    var parkingRepository: ParkingRepositoryProtocol
    var isLoading = false

    // MARK: - Init
    init(parkingRepository: ParkingRepositoryProtocol) {
        self.parkingRepository = parkingRepository
    }

    // MARK: - Methods
    func onAppear() async {
        do {
            isLoading = true
            reservations = try await parkingRepository.fetchReservationsHistory()
            isLoading = false
        } catch {
            // TODO: error
            isLoading = false
        }
    }
}
