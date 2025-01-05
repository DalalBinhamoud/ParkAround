//
//  ParkingDetailsClass.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation
import SwiftData

// create a class for ParkingDetails to be saved in SwiftData
@Model
final class ParkingDetailsClass: Hashable, Identifiable {

    @Attribute(.unique) var id: UUID
    let name: String
    let rate: Double
    let costPerHour: Double
    let availableSpots: Int
    let totalSpots: Int


    init(name: String, rate: Double, costPerHour: Double, availableSpots: Int, totalSpots: Int) {
        self.id = UUID()
        self.name = name
        self.rate = rate
        self.costPerHour = costPerHour
        self.availableSpots = availableSpots
        self.totalSpots = totalSpots
    }
}
