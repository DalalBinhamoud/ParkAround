//
//  MainView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 02/01/2025.
//

import SwiftUI

struct MainView: View {
    @State var isActive = false
    var body: some View {
        ZStack {
            if isActive {
                AppCoordinatorView()
            } else {
                SplashView()
            }
        }
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(3))
                withAnimation {
                    isActive = true
                }
            }
        }
    }

}
