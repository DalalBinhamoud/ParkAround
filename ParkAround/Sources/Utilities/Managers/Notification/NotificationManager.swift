//
//  NotificationManager.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation
import UserNotifications

class NotificationManager: NotificationManagerProtocol {
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                // TODO: needed?
            } else if let error = error {
                print(error)
                // TODO: handle notification error
            }

        }
    }

    func scheduleNotification(remainingTime: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = "Reservation Expiring Soon"
        content.body = "Your parking reservation is about to expire in 5 minutes"
        content.sound = .default

        // schedule notificate to be displayed 5 minutes before expiration
        let triggerTime = remainingTime - 300
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: triggerTime, repeats: false)
        let request = UNNotificationRequest(identifier: "SessionExpiration", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            // TODO: handle notification error
        }
    }

    func cancelNotification() {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["SessionExpiration"])
    }
}
