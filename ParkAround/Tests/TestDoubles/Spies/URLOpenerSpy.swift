//
//  URLOpenerSpy.swift
//  ParkAround
//
//  Created by Dalal Macbook on 04/01/2025.
//

import Foundation
import UIKit

class URLOpenerSpy: URLOpener {

    var openedURL: URL?
    var openURLCallsCount = 0
    func canOpen(_ url: URL) -> Bool {
        return true
    }

    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completion: ((Bool) -> Void)?) {

        openedURL = url
        openURLCallsCount += 1

        completion?(true)
    }
}
