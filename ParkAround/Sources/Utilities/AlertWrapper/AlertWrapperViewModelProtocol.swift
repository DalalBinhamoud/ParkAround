//
//  AlertWrapperViewModelProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation
import SwiftUI


protocol AlertWrapperViewModelProtocol {

    @MainActor
    func showAlert(title: String, description: String, icon: Image)
}
