//
//  FavoriteParking.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation
import SwiftData

@Model
final class FavoriteParking: Identifiable {
    @Attribute(.unique) var id : UUID
    let parkingDetails: ParkingDetailsClass
    let date: Date

    init(parkingDetails: ParkingDetailsClass) {
        self.id = UUID()
        self.date = Date()
        self.parkingDetails = parkingDetails
    }
}
