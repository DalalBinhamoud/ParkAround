//
//  ParkingDetails.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation
import MapKit

struct ParkingDetails: Hashable, Identifiable {

    let id: Int
    let name: String
    let rate: Double
    let costPerHour: Double
    let address: GeoLocation
    let availableSpots: Int
    let totalSpots: Int

    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: address.latitude, longitude: address.longitude)
    }

    var occupancyPercentage: Double {
        let doubledAvailableSpots = Double(availableSpots)
        let doubledTotalSpots = Double(totalSpots)
        let result = (doubledAvailableSpots / doubledTotalSpots)  * 100
        return result
    }

    /*
     The parking status is `occupied` when the percentage is 100%, which means there is no available spot
     The parking status is `busy` when the percentage is between 71 and 99, which means the parking is almost full
     */

    var parkingStatus: ParkingStatus {
        switch occupancyPercentage {
        case 100:  
            ParkingStatus.occupied
        case 71...99:
            ParkingStatus.busy
        default:
            ParkingStatus.available
        }
    }

    init(id: Int, name: String, rate: Double, costPerHour: Double, address: GeoLocation, availableSpots: Int, totalSpots: Int) {
        self.id = id
        self.name = name
        self.rate = rate
        self.costPerHour = costPerHour
        self.address = address
        self.availableSpots = availableSpots
        self.totalSpots = totalSpots
    }
}
