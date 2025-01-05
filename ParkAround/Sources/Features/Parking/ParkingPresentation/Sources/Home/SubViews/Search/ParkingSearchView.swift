//
//  ParkingSearchView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 03/01/2025.
//

import SwiftUI

// TODO: create a generic search View
struct ParkingSearchView: View {
    @Binding var searchQuery: String

    var body: some View {
        HStack {
            TextField("Search for parking name and address", text: $searchQuery)
                .padding(Spacing.small)
                .background(Colors.background)
                .cornerRadius(CornerRadius.small)

            if !searchQuery.isEmpty {
                Button(action: {
                    searchQuery = ""
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
    ParkingSearchView(searchQuery: .constant(""))
}
