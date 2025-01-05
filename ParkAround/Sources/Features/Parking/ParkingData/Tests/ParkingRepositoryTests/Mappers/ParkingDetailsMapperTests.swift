//
//  ParkingDetailsMapperTests.swift
//  ParkAroundTests
//
//  Created by Dalal Macbook on 31/12/2024.
//

import XCTest
@testable import ParkAround

final class ParkingDetailsMapperTests: XCTestCase {

    func test_givenValidParkingDetailsDTO_whenMap_thenReturnParkingDetails() {
        // Given
        let dto = ParkingDetailsDTO.StubFactory.make()

        // When
        let parkingDetails = ParkingDetailsMapper.map(from: dto)

        // Then
        XCTAssertEqual(parkingDetails.id, dto.id)
        XCTAssertEqual(parkingDetails.name, dto.name)
        XCTAssertEqual(parkingDetails.rate, dto.rate)
        XCTAssertEqual(parkingDetails.costPerHour, dto.costPerHour)
        XCTAssertEqual(parkingDetails.address.latitude, dto.latitude)
        XCTAssertEqual(parkingDetails.address.longitude, dto.longitude)
        XCTAssertEqual(parkingDetails.availableSpots, dto.availableSpots)
        XCTAssertEqual(parkingDetails.totalSpots, dto.totalSpots)
    }
}
