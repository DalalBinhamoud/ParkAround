//
//  ParkingDetailsView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 03/01/2025.
//

import SwiftUI

struct ParkingDetailsView: View {

//    @Binding private var parkingSpotDetails: ParkingDetails
    private var parkingSpotDetails: ParkingDetails

    init(parkingSpotDetails: ParkingDetails) {
        self.parkingSpotDetails = parkingSpotDetails
    }

    var body: some View {
        Text(parkingSpotDetails.name)
    }
}

#Preview {
    ParkingDetailsView(parkingSpotDetails: ParkingDetails.StubFactory.make())
}
