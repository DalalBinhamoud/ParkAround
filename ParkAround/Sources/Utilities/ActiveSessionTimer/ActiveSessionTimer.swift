//
//  ActiveSessionTimer.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Combine
import Foundation


class ActiveSessionTimer: ActiveSessionTimerProtocol {
    

    // MARK: - Properties
    let allowedActiveSesstionTimer: TimeInterval
    private(set) var isActive = false
    private var activeSessionCompletion: @MainActor () -> Void = {}
    private var cancellable: AnyCancellable?
    private(set) var startSessionDate: Date?
//    private var interactionSubject: AnyCancellable?
    private var notificationCenter: NotificationCenter


    // MARK: - Init
    init(allowedActiveSesstionTimer: TimeInterval, isActive: Bool = false, activeSessionCompletion: @escaping () -> Void, cancellable: AnyCancellable? = nil, startSessionDate: Date? = nil, notificationCenter: NotificationCenter = NotificationCenter.default) {
        self.allowedActiveSesstionTimer = allowedActiveSesstionTimer
        self.isActive = isActive
        self.activeSessionCompletion = activeSessionCompletion
        self.cancellable = cancellable
        self.startSessionDate = startSessionDate
        self.notificationCenter = notificationCenter
    }

    // MARK: - Methods
    func start(_ complete: @escaping @MainActor () -> Void) {
        // TODO:
    }
    
    func stop() {
        // TODO:
    }
    
    
}
