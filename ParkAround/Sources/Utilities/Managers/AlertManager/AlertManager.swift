//
//  AlertManager.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation
import SwiftUI


final class AlertManager: ObservableObject, AlertManagerProtocol {
    @Published var isShowing = false
    @Published var title = ""
    @Published var message = ""

    func showToast(title: String, message: String) {
        self.title = title
        self.message = message

        isShowing = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismissToast()
        }
    }

    func dismissToast() {
        withAnimation {
            self.isShowing = false
        }
    }
}
