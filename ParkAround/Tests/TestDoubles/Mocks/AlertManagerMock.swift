//
//  AlertManagerMock.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation

final class AlertManagerMock: AlertManagerProtocol {
    @Published var isShowing = false
    @Published var title = ""
    @Published var message = ""

    func showToast(title: String, message: String) {
        self.title = title
        self.message = message

        isShowing = true
    }

    func dismissToast() {
        self.isShowing = false
    }

}
