//
//  MockedNetworkClient.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

// this `MockedNetworkClient` is created for code functionality check
class MockedNetworkClient: NetworkClientProtocol {

    // MARK: - Properties
    private let urlSession: URLSession

    // MARK: - Init
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func get<T: Decodable>(
        endpoint: String,
        headers: HTTPHeaders,
        expecting type: T.Type
    ) async -> Result<T, NetworkError> {
        await request(
            endpoint: endpoint,
            headers: headers,
            method: .get,
            expecting: type
        )
    }

    func post<T: Decodable>(
        endpoint: String,
        headers: HTTPHeaders,
        body: Data?,
        expecting type: T.Type
    ) async -> Result<T, NetworkError> {
        await request(
            endpoint: endpoint,
            headers: headers,
            method: .post,
            body: body,
            expecting: type
        )
    }

    func request<T: Decodable>(
        endpoint: String,
        headers: HTTPHeaders,
        method: HTTPMethod,
        body: Data? = nil,
        expecting type: T.Type
    ) async -> Result<T, NetworkError> {

        let baseURL = Constants.baseURL + endpoint

        let responseFileName: String

        switch endpoint {
        case Constants.parkingSpotsEndpoint:
            responseFileName = Constants.parkingSpotsFileName
        case Constants.parkingSpotEndpoint:
            responseFileName = Constants.parkingSpotFileName
        default:
            return .failure(.invalidURL(url: baseURL))
        }

        // load JSON
        guard let response: T = JSONLoader.loadJSON(for: responseFileName, as: type) else {
            return .failure(.invalidResponse(url: baseURL))
        }

        return .success(response)
    }
}

extension MockedNetworkClient {
    private enum Constants {
        static let baseURL = "https://mock-parking-api.example.com"
        static let parkingSpotEndpoint = "/parking-spots/3"
        static let parkingSpotsEndpoint = "/parking-spots"
        static let parkingSpotFileName = "MockedParkingSpot"
        static let parkingSpotsFileName = "MockedParkingSpots"
    }
}
