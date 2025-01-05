//
//  MainView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 02/01/2025.
//

import SwiftUI

struct MainView: View {

    // MARK: - Properties
    @State var isActive = false
    @StateObject var locationManager = LocationManager()

    // MARK: - Body
    var body: some View {
        ZStack {
            if isActive {
                if locationManager.isLocationEnabled {
                        AppCoordinatorView()
                } else {
                    LocationDisabledView()
                }

            } else {
                SplashView()
            }
        }
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(3)) // hide splash screen after 2 seconds
                withAnimation {
                    isActive = true
                }
                locationManager.checkLocationAuthorization()
            }
        }
    }

}
