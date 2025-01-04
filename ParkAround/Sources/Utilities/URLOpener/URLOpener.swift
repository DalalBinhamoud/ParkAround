//
//  URLOpener.swift
//  ParkAround
//
//  Created by Dalal Macbook on 03/01/2025.
//

import Foundation
import UIKit

protocol URLOpener {
    func canOpen(_ url: URL) -> Bool
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any], completion: ((Bool) -> Void)?)
}

extension URLOpener {
    
    func canOpen(_ url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }

    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completion: ((Bool) -> Void)? = nil) {
        UIApplication.shared.open(url, options: options, completionHandler: completion)
    }
}

extension UIApplication: URLOpener { }
