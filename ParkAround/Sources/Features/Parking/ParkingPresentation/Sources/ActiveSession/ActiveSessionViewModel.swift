//
//  ActiveSessionViewModel.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import BackgroundTasks
import Foundation

// TOOD: confirm to protocol
class ActiveSessionViewModel: ObservableObject {

    // MARK: - Properties
    @Published var isActive = false
    @Published var remainingTime: TimeInterval?

    // private
    private let timerManager = TimerManager()
    private let notificationManager = NotificationManager()

    // MARK: - Init
    init() {
        restoreSession()
    }

    // MARK: - Methods

    func requestNotificationPermission() {
        notificationManager.requestPermission()
    }

    func startSession(duration: TimeInterval) {
        requestNotificationPermission() // TODO:
        timerManager.startSession(duration: duration)
        remainingTime = duration
        isActive = true

        notificationManager.scheduleNotification(remainingTime: duration)
        scheduleBackgroundTask()
    }

    func restoreSession() {
        if let updatedRemainingTime = timerManager.calculateRemainingTime(), updatedRemainingTime > 0 {
            remainingTime = updatedRemainingTime
            isActive = true
            scheduleBackgroundTask()
        } else {
            stopSession()
        }
    }

    func stopSession() {
        timerManager.stopSession()
        notificationManager.cancelNotification()
        cancelBackgroundTask()

        isActive = false
        remainingTime = nil
    }

    func updateRemainingTime() {
        if let remainingTime = timerManager.calculateRemainingTime(), remainingTime > 0 {
            self.remainingTime = remainingTime
        } else {
            stopSession()
        }
    }

    // the session should be tracked even if the app state in background
    func scheduleBackgroundTask() {
        let request = BGAppRefreshTaskRequest(identifier: "com.AppAround")
        request.earliestBeginDate = Date().addingTimeInterval(5 * 60) // check every 5 minutes

        do {
            try BGTaskScheduler.shared.submit(request)

        } catch {
            // TODO: handle erro
        }
    }

    func cancelBackgroundTask() {
        BGTaskScheduler.shared.cancelAllTaskRequests()
    }
}
