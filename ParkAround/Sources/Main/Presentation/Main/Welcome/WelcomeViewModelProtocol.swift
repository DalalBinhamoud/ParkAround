//
//  WelcomeViewModelProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

protocol WelcomeViewModelProtocol: ObservableObject {
    var onContinue: () -> Void { get }
}
