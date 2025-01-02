//
//  AlertWrapperViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation
import SwiftUI

class AlertWrapperViewModel: ObservableObject, AlertWrapperViewModelProtocol {

    // MARK: - Properties
    @Published var showToast = false
    @Published var title = ""
    @Published var description = ""
    @Published var icon: Image?


//    // MARK: - Init
//    init() { }

    init(showToast: Bool = false, title: String = "", description: String = "", icon: Image? = nil) {
        self.showToast = showToast
        self.title = title
        self.description = description
        self.icon = icon
    }

    // MARK: - Methods
    func showAlert(title: String, description: String, icon: Image) {
        self.title = title
        self.description = description
        self.icon = icon
    }
}
