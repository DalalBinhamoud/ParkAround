//
//  FavoriteParkingsViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation


class FavoriteParkingsViewModel: FavoriteParkingsViewModelProtocol {

    // MARK: - Properties
    var favoriteParkings: [FavoriteParking] = []
    var parkingRepository: ParkingRepositoryProtocol
    var isLoading = false

    // MARK: - Init
    init(parkingRepository: ParkingRepositoryProtocol) {
        self.parkingRepository = parkingRepository
    }

    func onAppear() async {
        do {
            isLoading = true
            favoriteParkings = try await parkingRepository.fetchFavoriteParkings()
            isLoading = false
        } catch {
            // TODO: error
            isLoading = false
        }
    }
}
