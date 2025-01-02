//
//  NetworkClientMock.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

final class NetworkClientMock: NetworkClientProtocol {

    var endpoint: String?
    var method: HTTPMethod?
    var headers: HTTPHeaders?
    var body: Data?
    var expectedType: Any?

    let responseMock = HTTPURLResponse()

    func get<T>(endpoint: String, headers: HTTPHeaders, expecting type: T.Type) async -> Result<T, NetworkError> where T : Decodable {
        await request(
            endpoint: endpoint,
            headers: headers,
            method: .get,
            expecting: type
        )
    }
    
    func post<T>(endpoint: String, headers: HTTPHeaders, body: Data?, expecting type: T.Type) async -> Result<T, NetworkError> where T : Decodable {
        await request(
            endpoint: endpoint,
            headers: headers,
            method: .post,
            body: body,
            expecting: type
        )
    }
    
    func request<T>(endpoint: String, headers: HTTPHeaders, method: HTTPMethod, body: Data? = nil, expecting type: T.Type) async -> Result<T, NetworkError> where T : Decodable {
        self.endpoint = endpoint
        self.headers = headers
        self.method = method
        self.body = body
        self.expectedType = type


        let mockedResponse: T? = responseMock as? T
        if let mockedResponse {
            return .success(mockedResponse)
        }

        return .failure(.invalidResponse(url: "endpoint"))

    }
}
