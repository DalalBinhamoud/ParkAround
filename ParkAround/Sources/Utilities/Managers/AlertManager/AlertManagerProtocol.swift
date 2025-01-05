//
//  AlertManagerProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 05/01/2025.
//

import Foundation

import Foundation
import SwiftUI


protocol AlertManagerProtocol {

    var isShowing: Bool { get }
    var title: String { get }
    var message: String { get }

    func showToast(title: String, message: String)
    func dismissToast()
}
