//
//  ActiveSessionTimerProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

protocol ActiveSessionTimerProtocol {
    var isActive: Bool { get }

    func start(_ complete: @escaping @MainActor () -> Void)
    func stop()
}
