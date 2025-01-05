//
//  Routes.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation


enum Route {
    case welcome
    case home(homeRoute: HomeRoute)
    case locationDisabled
}

enum HomeRoute: Hashable {
    case parkings
    case parkingDetails(info: ParkingDetails)
    case favoriteParkings
    case reservationHistory
}

enum ParkingRoute {
    case reservation(praking: ParkingDetails)
    case pay
}
