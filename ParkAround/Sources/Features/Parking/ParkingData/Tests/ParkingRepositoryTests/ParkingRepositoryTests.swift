//
//  ParkingRepositoryTests.swift
//  ParkAroundTests
//
//  Created by Dalal Macbook on 31/12/2024.
//

import SwiftData
import XCTest

@testable import ParkAround


final class ParkingRepositoryTests: XCTestCase {

    private var serviceSpy: ParkingServiceSpy!
    private var sut: ParkingRepository!

    let container = try! ModelContainer(for: ParkingReservation.self)

    // MARK: - Setup
    @MainActor
    override func setUp() {
        super.setUp()

        serviceSpy = ParkingServiceSpy()
        sut = ParkingRepository(
            parkingService: serviceSpy,
            context: container.mainContext
        )
    }

    override func tearDown() {
        serviceSpy = nil
        super.tearDown()
    }

    func test_givenServiceFailure_whenFetchParkingSpots_thenThrowError() async {
        // Given
        serviceSpy.getNearbyParkingSpotsTask = Task { throw ParkingServiceError.unexpectedType }

        // When && Then
        do {
            _ = try await sut.fetchParkingSpots(userLocation: GeoLocation.StubFactory.make())
            XCTFail("Method should have thrown an error")
        } catch {
            XCTAssertTrue(true, "Should throw an error")
        }
    }

    func test_givenExpectedResult_whenFetchParkingSpots_thenServiceCalled() async {
        // Given
        let dto = ParkingDetailsDTO.StubFactory.make()
        let expectedResult = ParkingDetailsMapper.map(from: dto)

        serviceSpy.getNearbyParkingSpotsTask = Task { [dto] }


        // When
        let result = try? await sut.fetchParkingSpots(userLocation: GeoLocation.StubFactory.make())

       // Then
        XCTAssertEqual(result, [expectedResult])
        XCTAssertEqual(serviceSpy.getNearbyParkingSpotsCallsCount, 1)
    }

}
