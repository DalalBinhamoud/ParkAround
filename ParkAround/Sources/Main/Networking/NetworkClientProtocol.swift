//
//  NetworkClientProtocol.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

protocol NetworkClientProtocol {
    
    func get<T: Decodable> (
    endpoint: String,
    headers: HTTPHeaders,
    expecting type: T.Type
    ) async -> Result<T, NetworkError>

    func post<T: Decodable> (
    endpoint: String,
    headers: HTTPHeaders,
    body: Data?,
    expecting type: T.Type
    ) async -> Result<T, NetworkError> 

    func request<T: Decodable> (
    endpoint: String,
    headers: HTTPHeaders,
    method: HTTPMethod,
    body: Data?,
    expecting type: T.Type
    ) async -> Result<T, NetworkError>
}
