//
//  WelcomeViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

class WelcomeViewModel: WelcomeViewModelProtocol {
    
    // MARK: - Properties
    var onContinue: () -> Void

    // MARK: - Init
    init(onContinue: @escaping () -> Void) {
        self.onContinue = onContinue
    }
}
