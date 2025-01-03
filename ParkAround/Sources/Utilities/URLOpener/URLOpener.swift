//
//  URLOpener.swift
//  ParkAround
//
//  Created by Dalal Macbook on 03/01/2025.
//

import Foundation
import UIKit

protocol URLOpener {
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any]) // completionHandler: ((Bool) -> Void)?
}


extension UIApplication: URLOpener {
    func open(_ url: URL, options: [OpenExternalURLOptionsKey : Any]) { //completionHandler: ((Bool) -> Void)? = nil
        open(url, options: options)
    }
}
