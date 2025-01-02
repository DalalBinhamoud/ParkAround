//
//  NearbyParkingSpotsRequestTests.swift
//  ParkAroundTests
//
//  Created by Dalal Macbook on 01/01/2025.
//

import XCTest
@testable import ParkAround


final class NearbyParkingSpotsRequestTests: XCTestCase {

    func test_whenInit_thenPropertiesSetCorrectly() {
        
        // When
        let request = NearbyParkingSpotsRequest(userLocation: GeoLocation.StubFactory.make())

        // Then
        XCTAssertEqual(request.endpoint, "/parking-spots")
        XCTAssertEqual(request.method, HTTPMethod.get)
        XCTAssertTrue(request.headers.isEmpty)
    }
}
