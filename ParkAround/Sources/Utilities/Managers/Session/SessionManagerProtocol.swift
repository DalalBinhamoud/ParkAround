//
//  SessionManagerProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation

protocol SessionManagerProtocol: ObservableObject {

    var remainingTime: TimeInterval? { get }
    var isActive: Bool { get }

    func startSesstion(duration: TimeInterval)
    func stopSesstion()
    func restoreSesstion()

}
