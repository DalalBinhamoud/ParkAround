//
//  TimerManagerProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

protocol TimerManagerProtocol {
    var sessionStartTime: Date? { get }
    var sessionDuration: TimeInterval? { get }

    func startSession(duration: TimeInterval)
    func stopSession()
    func calculateRemainingTime() -> TimeInterval?
}
