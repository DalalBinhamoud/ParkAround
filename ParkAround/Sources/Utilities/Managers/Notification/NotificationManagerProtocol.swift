//
//  NotificationManagerProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

protocol NotificationManagerProtocol {
    func requestPermission()
    func scheduleNotification(remainingTime: TimeInterval)
    func cancelNotification()
}
