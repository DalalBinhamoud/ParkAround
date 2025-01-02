//
//  ParkingServiceTests.swift
//  ParkAroundTests
//
//  Created by Dalal Macbook on 31/12/2024.
//

import XCTest
@testable import ParkAround

final class ParkingServiceTests: XCTestCase {

    // MARK: - Properties
    private var apiServiceSpy: APIServiceSpy!
    private var sut: ParkingService!

    // MARK: - Setup
    override func setUp() {
        super.setUp()

        apiServiceSpy = APIServiceSpy()
        sut = ParkingService(serviceProvider: apiServiceSpy)
    }

    override func tearDown() {
        apiServiceSpy = nil
        sut = nil
        super.tearDown()
    }

    func test_givenAPIFails_whenGetParkings_thenThrowsError() async {
        do {
            // Given
            apiServiceSpy.sendRequestReturnResult = .failure(ErrorStub())

            // When
            _ = try await sut.getNearbyParkingSpots(userLocation: GeoLocation.StubFactory.make())

            // Then
            XCTFail("Method must rhrown an erro")
        } catch {
            XCTAssertTrue(true, "")
            XCTAssertNotNil(error as? ErrorStub)
            XCTAssertEqual(apiServiceSpy.sendRequestCallsCount, 1)
        }
    }

    func test_givenAPISuccess_whenGetParkings_thenServiceReturnsResult() async throws {

            // Given
        let expectedResult = ParkingDetailsDTO.StubFactory.make()
            apiServiceSpy.sendRequestReturnResult = .success(expectedResult)

            // When
        let result = try await sut.getNearbyParkingSpots(userLocation: GeoLocation.StubFactory.make())

            // Then
            XCTAssertEqual(result, [expectedResult])
    }
}
