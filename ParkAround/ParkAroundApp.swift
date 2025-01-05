//
//  ParkAroundApp.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import SwiftUI
import SwiftData

@main
struct ParkAroundApp: App {

    let persistenceController = PersistenceController.shared
    let alertManager = AlertManager()

    var body: some Scene {
        WindowGroup {
                MainView()
                    .modelContainer(persistenceController.container)
        }
    }
}
