//
//  WelcomeViewUITests.swift
//  ParkAroundUITests
//
//  Created by Dalal Macbook on 05/01/2025.
//

import XCTest

final class WelcomeViewUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testWelcomeView_UIElementsExist() {
        let sloganText = app.staticTexts["text_slogan"]
        XCTAssertTrue(sloganText.exists)

        let continueButton = app.buttons["button_onContinue"]
        XCTAssertTrue(continueButton.exists)
    }

    func test_EnsureButtonIsHittable() {
        let continueButton = app.buttons["button_onContinue"]
        XCTAssertTrue(continueButton.isHittable)
    }
}
