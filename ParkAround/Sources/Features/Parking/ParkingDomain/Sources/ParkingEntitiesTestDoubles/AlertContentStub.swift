//
//  AlertContentStub.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation

extension AlertContent {
    enum StubFactory {
        static func make(
            title: String = "Alert!",
            message: String = "content!"
        ) -> AlertContent {
            AlertContent(
                title: title,
                message: message
            )
        }
    }
}
