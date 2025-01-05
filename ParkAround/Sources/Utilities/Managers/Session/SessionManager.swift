//
//  SessionManager.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation


class SessionManager: SessionManagerProtocol {

    // MARK: - Properties
    @Published private(set) var remainingTime: TimeInterval? = nil
    @Published private(set) var isActive = false

    private var sessionStartTime: Date?
    private var sessionDuration: TimeInterval?
    private var timer: Timer?

    // MARK: - Methods
    func startSesstion(duration: TimeInterval) {
        <#code#>
    }
    
    func stopSesstion() {
        <#code#>
    }
    
    func restoreSesstion() {
        <#code#>
    }
    
    
}

extension SessionManager {
    private enum Constants {
        static let sessionStartKey = "sessionStartKey"
        static let sessionDurationKey = "sessionDurationKey"
    }
}
