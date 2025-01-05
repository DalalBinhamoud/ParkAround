//
//  ParkingSpotsMapViewModelProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation
import SwiftData

protocol ParkingSpotsMapViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    var parkingSpots: [ParkingDetails] { get }
    var paymentRepository: PaymentRepositoryProtocol { get }
    var modelContext: ModelContext? {get }

    func onAppear() async

}


extension ParkingSpotsMapViewModelProtocol {
    func getFilteredSpots(for query: String) -> [ParkingDetails] {
        guard !query.isEmpty else {
            return parkingSpots
        }
        return parkingSpots.filter { spot in
            spot.name.lowercased().contains(query.lowercased()) || spot.address.description.lowercased().contains(query.lowercased())

        }
    }
}
