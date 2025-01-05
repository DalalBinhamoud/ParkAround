//
//  FavoriteParkingsViewModelProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation

protocol FavoriteParkingsViewModelProtocol: ObservableObject {
    var favoriteParkings: [FavoriteParking] { get }
    var isLoading: Bool { get }

    func onAppear() async
}
