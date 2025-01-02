//
//  APIServiceSpy.swift
//  ParkAround
//
//  Created by Dalal Macbook on 31/12/2024.
//

import Foundation

final class APIServiceSpy: APIServiceProtocol {

    var sendRequestReturnResult: Result<Any, Error> = .failure(ErrorStub())
    private(set) var sendRequestCallsCount = 0
    func sendRequest<T>(_ request: T) async throws -> T.ResponseType? where T : ApiRequest {
        sendRequestCallsCount += 1
        return try sendRequestReturnResult.get() as? T.ResponseType
    }
}
