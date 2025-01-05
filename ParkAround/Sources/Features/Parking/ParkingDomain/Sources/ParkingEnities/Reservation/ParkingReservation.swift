//
//  ParkingReservation.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation
import SwiftData

@Model
final class ParkingReservation: Identifiable {
    @Attribute(.unique) var id: UUID
    var address: GeoLocation
    var cost: Double
    var date: Date
    var duration: Int
    
    init(address: GeoLocation, cost: Double, date: Date, duration: Int) {
        self.id = UUID()
        self.address = address
        self.cost = cost
        self.date = date
        self.duration = duration
    }

}
