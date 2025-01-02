//
//  APIService.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation


// TODO: replace the mocked NetworkClient
class APIService: APIServiceProtocol {

    // MARK: - Properties
    var netWorkClient: MockedNetworkClient //NetworkClient
    let locationProvider: LocationManagerProtocol

    // MARK: - Init
    init(locationProvider: LocationManagerProtocol) {
        self.netWorkClient = MockedNetworkClient()  //NetworkClient(urlSession: .shared)
        self.locationProvider = locationProvider
    }

    func sendRequest<T>(_ request: T) async throws -> T.ResponseType? where T : ApiRequest {
        try await request.doRequest(netWorkClient)
    }
}
