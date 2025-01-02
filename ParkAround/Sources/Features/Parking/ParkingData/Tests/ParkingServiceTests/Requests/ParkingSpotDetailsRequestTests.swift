//
//  ParkingSpotDetailsRequestTests.swift
//  ParkAroundTests
//
//  Created by Dalal Macbook on 01/01/2025.
//

import XCTest
@testable import ParkAround

final class ParkingSpotDetailsRequestTests: XCTestCase {

    func test_whenInit_thenPropertiesSetCorrectly() {
        
        // When
        let request = ParkingSpotDetailsRequest(id: "3")

        // Then
        XCTAssertEqual(request.endpoint, "/parking-spots/3")
        XCTAssertEqual(request.method, HTTPMethod.get)
        XCTAssertTrue(request.headers.isEmpty)
    }
}
