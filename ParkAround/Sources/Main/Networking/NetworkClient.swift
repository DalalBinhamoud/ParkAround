//
//  NetworkClient.swift
//  ParkAround
//
//  Created by Dalal Macbook on 30/12/2024.
//

import Foundation

struct NetworkClient: NetworkClientProtocol {

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
        do {
            let baseURL = "https://example.com" + endpoint
            guard let url = URL(string: baseURL) else {
                return .failure(NetworkError.invalidURL(url: baseURL))
            }

            var request = URLRequest(url: url)

            request.httpMethod = method.rawValue

            headers.forEach { field, value in
                request.addValue(value, forHTTPHeaderField: field)
            }

            request.httpBody = body

            let (data, response) = try await urlSession.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(NetworkError.invalidResponse(url: "baseURL1"))
            }

            guard httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 else {
                return .failure(NetworkError.fail(data, httpResponse, url: baseURL))
            }
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)

            return .success(decodedResponse)

        } catch let urlError as URLError {
            if urlError.code == .notConnectedToInternet {
                return .failure(.noNetwork)
            } else {
                return .failure(.other(urlError))
            }
        }
        catch {
            return .failure(.other(error))
        }
    }
}
