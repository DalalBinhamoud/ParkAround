//
//  FavoriteParkingsView.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import SwiftData
import SwiftUI

struct FavoriteParkingsView<ViewModel>: View where ViewModel: FavoriteParkingsViewModelProtocol {

    // MARK: - Properties
    @Environment(\.modelContext) var context
    @Query private var favoriteParkings: [FavoriteParking]
    @StateObject private var viewModel: ViewModel

    // MARK: - Init

    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Text("Favorite Parking Locations")
            ForEach(favoriteParkings) { favoriteParking in
                Text(favoriteParking.parkingDetails.name)
            }

        }
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

#Preview {

    class ViewModelFixture: FavoriteParkingsViewModelProtocol {
        var favoriteParkings: [FavoriteParking] = []
        var isLoading = false
        func onAppear() async {/* Preview */}
    }

    return FavoriteParkingsView(
        viewModel: ViewModelFixture()
    )
}
