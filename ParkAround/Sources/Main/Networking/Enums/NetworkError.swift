//
//  NetworkError.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL(url: String)
    case fail(Data, HTTPURLResponse, url: String)
    case invalidResponse(url: String)
    case noNetwork
    case other(Error)

    var errorDescription: String {
        switch self {
        case .invalidURL(let url):
            return "The URL: \(url) is invalid"
        case .fail(_, _, url: let url):
            return "The server \(url) respond with an error"
        case .invalidResponse(url: let url):
            return "invalid Response, ccc URL: \(url)"
        case .noNetwork:
            return "Please check yout network connect then try again" 
        case .other(let error):
            return "Error: \(error)"
        }
    }
}
