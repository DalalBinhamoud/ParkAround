//
//  ParkingSearchView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 03/01/2025.
//

import SwiftUI

// TODO: create a generic search View
struct ParkingSearchView: View {
    @Binding var searchQurey: String

    var body: some View {
        HStack {
            TextField("Search for parking name and address", text: $searchQurey)
                .padding(Spacing.small)
                .background(Colors.background)
                .cornerRadius(CornerRadius.small)

            if !searchQurey.isEmpty {
                Button(action: {
                    searchQurey = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Colors.background)
                })
            }
        }
        .padding(.horizontal, Spacing.large)
    }
}

#Preview {
    ParkingSearchView(searchQurey: .constant(""))
}
