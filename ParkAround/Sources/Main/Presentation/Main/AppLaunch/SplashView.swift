//
//  SplashView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 02/01/2025.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Colors.primary
                .ignoresSafeArea()
            VStack {
                Image("splash", bundle: .main)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    SplashView()
}
