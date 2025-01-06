//
//  RemainingTimeViewModelProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 06/01/2025.
//

import Foundation

protocol RemainingTimeViewModelProtocol: ObservableObject {
    var isSessionActive: Bool { get }
    var remainingTimeString: String { get }
}
