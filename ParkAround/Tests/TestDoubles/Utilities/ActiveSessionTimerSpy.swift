//
//  ActiveSessionTimerSpy.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Combine

class ActiveSessionTimerSpy : ActiveSessionTimerProtocol {

    private let activeSessionTimer: ActiveSessionTimer
    var isActive: Bool { activeSessionTimer.isActive }

    private var cancellable = [AnyCancellable]()
    private var onComplete: (@MainActor () -> Void)?

    // MARK: - Init
    init(activeSessionTimer: ActiveSessionTimer, cancellable: [AnyCancellable] = [AnyCancellable](), onComplete: (() -> Void)? = nil) {
        self.activeSessionTimer = activeSessionTimer
        self.cancellable = cancellable
        self.onComplete = onComplete
    }

    func start(_ complete: @escaping @MainActor () -> Void) {
        onComplete = {
            complete()
        }
    }
    
    func stop() {
        activeSessionTimer.stop()
    }
}
