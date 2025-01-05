//
//  AlertManagerTest.swift
//  ParkAroundTests
//
//  Created by Dalal Macbook on 05/01/2025.
//

import XCTest

@testable import ParkAround

final class AlertManagerTest: XCTestCase {

    func test_whenShowToast_thenDisplaysMessage() {
        let mockToastManager = AlertManagerMock()

        mockToastManager.showToast(title: "Test title", message: "Test message")

        XCTAssertTrue(mockToastManager.isShowing)
        XCTAssertEqual(mockToastManager.title, "Test title")
        XCTAssertEqual(mockToastManager.message, "Test message")

        mockToastManager.dismissToast()
        XCTAssertFalse(mockToastManager.isShowing)
    }
}
