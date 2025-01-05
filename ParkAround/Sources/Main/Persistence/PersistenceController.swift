//
//  PersistenceController.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation
import SwiftData

class PersistenceController {
    static let shared = PersistenceController()
    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: ParkingReservation.self, FavoriteParking.self, ParkingDetailsClass.self)
        } catch {
            fatalError("failed")
        }
    }
}
