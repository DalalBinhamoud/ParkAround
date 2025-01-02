//
//  TimerManager.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

class TimerManager: TimerManagerProtocol {

    // MARK: - Properties
    var sessionStartTime: Date?
    var sessionDuration: TimeInterval?

    // MARK: - Methods
    func startSession(duration: TimeInterval) {
        let startTime = Date()
        UserDefaults.standard.set(startTime, forKey: Constants.sessionStartKey)
        UserDefaults.standard.set(duration, forKey: Constants.sessionDurationKey)
    }

    func calculateRemainingTime() -> TimeInterval? {
        guard let startTime = sessionStartTime, let duration = sessionDuration else {
            return nil
        }

        let elapsedTime = Date().timeIntervalSince(startTime)
        let remainingTime = duration - elapsedTime

        return remainingTime
    }

    func stopSession() {
        UserDefaults.standard.removeObject(forKey: Constants.sessionStartKey)
        UserDefaults.standard.removeObject(forKey: Constants.sessionDurationKey)
    }
}

extension TimerManager {
    private enum Constants {
        static let sessionStartKey = "sessionStartKey"
        static let sessionDurationKey = "sessionDurationKey"
    }
}
