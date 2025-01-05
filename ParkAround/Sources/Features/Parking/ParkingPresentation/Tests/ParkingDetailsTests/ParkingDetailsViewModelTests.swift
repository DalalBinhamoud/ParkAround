//
//  ParkingDetailsViewModelTests.swift
//  ParkAroundTests
//
//  Created by Dalal Macbook on 05/01/2025.
//

import XCTest

@testable import ParkAround

final class ParkingDetailsViewModelTests: XCTestCase {

    var sut: ParkingDetailsViewModel!
    var parkingRepositorySpy = ParkingRepositorySpy()
    var paymentRepositorySpy = PaymentRepositorySpy()

    override func setUp() {
        sut = ParkingDetailsViewModel(
            parkingDetails: ParkingDetails.StubFactory.make(),
            parkingRepository: parkingRepositorySpy,
            paymentRepository: paymentRepositorySpy
        )
    }

    override func tearDown() {
        sut = nil
    }

    func test_whenPressAddToFavorite_thenSaveParkingDetails() {
        // When
        sut.addToFavorite()

        // Then
        XCTAssertEqual(parkingRepositorySpy.addToFavoriteCallsCount, 1)
    }

    func test_whenPressProcessPayment_thenNewReservationAdded() {
        // When
        sut.addReservation()

        // Then
        XCTAssertEqual(parkingRepositorySpy.addReservationCallsCount, 1)
    }

    func test_givenSuccessfulResponse_whenPressProcessPayment_thenItProcdeed() async {
        // Given
        let expectedResult = true
        paymentRepositorySpy.processPaymentTask = Task { expectedResult }
        // When
        await sut.processPayment()

        // Then
        XCTAssertEqual(paymentRepositorySpy.processPaymentCallsCount, 1)
    }
}
