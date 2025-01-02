//
//  APIServiceProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

protocol APIServiceProtocol {
    func sendRequest<T>(_ request: T) async throws -> T.ResponseType? where T: ApiRequest
}
