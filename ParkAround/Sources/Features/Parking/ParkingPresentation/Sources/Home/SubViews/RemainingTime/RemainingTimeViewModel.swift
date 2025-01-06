//
//  RemainingTimeViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 06/01/2025.
//

import Combine
import Foundation
import SwiftUI

// TODO: add unit testing
class RemainingTimeViewModel: RemainingTimeViewModelProtocol {

    // MARK: - Properties
    @Published private(set) var sessionManager: ActiveSessionManagerProtocol
    @Published var remainingTimeString: String = "00:00"
    @Published var isSessionActive: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private var timerCancellable: AnyCancellable?

    // MARK: - Init
    init(sessionManager: ActiveSessionManagerProtocol) {
        self.sessionManager = sessionManager

        sessionManager.remainingTimePublisher
            .map { timeInterval -> String in
                guard let timeInterval = timeInterval else { return "00:00:00" }
                return Self.formatTimeInterval(timeInterval)
            }
            .receive(on: DispatchQueue.main)
            .assign(to: \.remainingTimeString, on: self)
            .store(in: &cancellables)

        sessionManager.isActivePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isActive in
                self?.isSessionActive = isActive
                if isActive {
                    self?.startCountdown()
                } else {
                    self?.stopCountdown()
                }
            }
            .store(in: &cancellables)
    }

    // display format  "00:00:00"
    private static func formatTimeInterval(_ timeInterval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        return formatter.string(from: timeInterval) ?? "00:00:00"
    }

}

// timer tracker
extension RemainingTimeViewModel {

    private func startCountdown() {
        timerCancellable?.cancel()

        timerCancellable = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                withAnimation {
                    self?.updateRemainingTime()
                }
            }
    }

    private func stopCountdown() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }

    private func updateRemainingTime() {
        if let remainingTime = sessionManager.remainingTime, remainingTime > 0 {
            sessionManager.remainingTimePublisher
                .receive(on: DispatchQueue.main)
                .sink { [weak self] updatedTime in
                    guard let timeInterval = updatedTime else { return }
                    self?.remainingTimeString = Self.formatTimeInterval(timeInterval)
                }
                .store(in: &cancellables)

            sessionManager.remainingTime = remainingTime - 1
        } else {
            stopCountdown()
            sessionManager.stopSession()
        }
    }

}
