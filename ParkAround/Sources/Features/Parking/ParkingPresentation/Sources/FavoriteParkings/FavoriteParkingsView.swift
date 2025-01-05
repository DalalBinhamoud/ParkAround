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
            if favoriteParkings.count == 0 {
                Spacer()
                emptyList
                Spacer()
            } else {
                ScrollView {
                    ForEach(favoriteParkings) { favoriteParking in
                        favoriteParkingCard(favoriteParking: favoriteParking)
                            .padding()
                    }
                }
            }

        }
        .navigationTitle("Favorite Parking Locations")
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

extension FavoriteParkingsView {
    @ViewBuilder private var emptyList: some View {
        VStack(spacing: Spacing.medium) {
            Image(systemName: "heart.slash")
                .resizable()
                .scaledToFit()
                .frame(width: IconSize.large, height: IconSize.large)

            Text("No Favorite Parkings")
                .foregroundStyle(Colors.text)
                .font(Fonts.subheading)

            Text("You can add favorite parking spot by clicking hear icon")
                .foregroundStyle(Colors.text)
                .lineSpacing(Spacing.small)
                .multilineTextAlignment(.center)
                .font(Fonts.body)
        }
    }

   private func favoriteParkingCard(favoriteParking: FavoriteParking) -> some View {
       VStack(alignment: .leading) {
            MakeRow(imageName: "calendar", title: favoriteParking.date.formatted(date: .abbreviated, time: .shortened))

           Divider()
               .frame(height: 2)
               .background(Colors.text)

           MakeRow(imageName: "mappin.and.ellipse", title: favoriteParking.parkingDetails.name)
           MakeRow(imageName: "dollarsign.circle", title: "\(favoriteParking.parkingDetails.costPerHour)")
        }
       .padding()
//       .frame(maxWidth: .infinity)
       .background(Colors.primary)
       .cornerRadius(CornerRadius.large)
       .shadow(radius: 3)
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
