//
//  ParkingSpotsMapViewModelProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

protocol ParkingSpotsMapViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    var parkingSpots: [ParkingDetails] { get }

    func onAppear() async

}
