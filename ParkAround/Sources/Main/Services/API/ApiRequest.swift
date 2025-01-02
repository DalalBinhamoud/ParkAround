//
//  ApiRequest.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

protocol ApiRequest: Encodable {

    associatedtype ResponseType: Decodable
    
    var endpoint: String { get }
    var headers: HTTPHeaders { get }
    var method: HTTPMethod { get }
}

extension ApiRequest {
    func doRequest(_ networkClient: NetworkClientProtocol) async throws -> ResponseType {
        do {
            let result = await networkClient.request(endpoint: endpoint, headers: headers, method: method, body: Data(), expecting: ResponseType.self)

            switch result {
            case let .success(data):
                return data
            case let .failure(error):
                throw error
            }
        } catch {
            throw error
        }
    }
}
