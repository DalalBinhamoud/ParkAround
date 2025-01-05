//
//  LoadingOverlay.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import SwiftUI

struct LoadingOverlay: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingOverlay()
}
