//
//  ParkingStatus.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation
import SwiftUI

enum ParkingStatus: String {
    case available = "Available"
    case busy = "Busy"
    case occupied = "Occupied" // no available spot
}


extension ParkingStatus {
    var backgroundColor: Color {
        switch self {
        case .available:
            Colors.success
        case .busy:
            Colors.warning
        case .occupied:
            Colors.failure
        }
    }
}
