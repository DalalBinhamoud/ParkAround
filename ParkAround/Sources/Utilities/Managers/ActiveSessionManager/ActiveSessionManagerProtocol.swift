//
//  ActiveSessionManagerProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Combine
import Foundation

protocol ActiveSessionManagerProtocol {
    var remainingTime: TimeInterval? { get set }
    var isActive: Bool { get }
    var remainingTimePublisher: Published<TimeInterval?>.Publisher { get }
    var isActivePublisher: Published<Bool>.Publisher { get }

    func startSession(duration: TimeInterval)
    func stopSession()
}
