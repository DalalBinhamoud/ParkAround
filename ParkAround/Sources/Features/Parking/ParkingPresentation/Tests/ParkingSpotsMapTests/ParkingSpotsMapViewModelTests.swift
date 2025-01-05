//
//  ParkingSpotsMapTests.swift
//  ParkAroundTests
//
//  Created by Dalal Macbook on 05/01/2025.
//

import XCTest

@testable import ParkAround

final class ParkingSpotsMapViewModelTests: XCTestCase {

    var sut: ParkingSpotsMapViewModel!
    var applicationServiceMock = ApplicationServiceMock()
    var parkingRepositorySpy = ParkingRepositorySpy()
    var paymentRepositorySpy = PaymentRepositorySpy()

    override func setUp() {
        sut = ParkingSpotsMapViewModel(
            applicationService: applicationServiceMock,
            parkingRepository: parkingRepositorySpy,
            paymentRepository: paymentRepositorySpy
        )
    }

    override func tearDown() {
        sut = nil
    }

    func test_givenSuccessfulResponse_whenOnAppear_thenRetriveData() async throws {
        // Given
        let expectedResult =  [ParkingDetails.StubFactory.make()]
        parkingRepositorySpy.fetchParkingSpotsTask = Task { expectedResult }

        // When
        await sut.onAppear()

        // Then
        XCTAssertEqual(parkingRepositorySpy.fetchParkingSpotsCallsCount, 1)
        XCTAssertEqual(sut.parkingSpots, expectedResult)
        XCTAssertFalse(sut.isLoading)

    }

    func test_givenFailedResponse_whenOnAppear_thenShowError() async throws {
        // Given
        parkingRepositorySpy.fetchParkingSpotsTask = Task { throw NSError() }

        // When
        await sut.onAppear()

        // Then
        XCTAssertEqual(parkingRepositorySpy.fetchParkingSpotsCallsCount, 1)
        XCTAssertTrue(sut.parkingSpots.isEmpty)
        XCTAssertFalse(sut.isLoading)
    }

    func test_whenProvideAvailableParkingStatus_thenGetExpectedImageName() {
        // When
        let availableStatus = ParkingStatus.available

        // Then
        XCTAssertEqual(sut.getParkingMarker(for: availableStatus), "park-marker-available")
    }

    func test_givenEmptySearchQuery_whenDisplayFilteredSpots_thenGetAllSpots() {
        // Given
        let mockSpots = [
            ParkingDetails(id: 1, name: "Downtown Parking", rate: 4.5, costPerHour: 30, address: GeoLocation(latitude: 0, longitude: 0), availableSpots: 10, totalSpots: 50),
            ParkingDetails(id: 2, name: "City Center Parking", rate: 4.0, costPerHour: 20, address: GeoLocation(latitude: 0, longitude: 0), availableSpots: 5, totalSpots: 20)
        ]
        let seatchQuery = ""
        sut.parkingSpots = mockSpots

        // When
        let result = sut.getFilteredSpots(for: seatchQuery)

        // Then
        XCTAssertEqual(result.count, mockSpots.count)
    }

    func test_givenEmptySearchQuery_whenDisplayFilteredSpots_thenGetOnlyFilteredSpots() {
        // Given
        let mockSpots = [
            ParkingDetails(id: 1, name: "Downtown Parking", rate: 4.5, costPerHour: 30, address: GeoLocation(latitude: 0, longitude: 0), availableSpots: 10, totalSpots: 50),
            ParkingDetails(id: 2, name: "City Center Parking", rate: 4.0, costPerHour: 20, address: GeoLocation(latitude: 0, longitude: 0), availableSpots: 5, totalSpots: 20)
        ]
        let seatchQuery = "Downtown"
        sut.parkingSpots = mockSpots

        // When
        let result = sut.getFilteredSpots(for: seatchQuery)

        // Then
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "Downtown Parking")
    }

}
