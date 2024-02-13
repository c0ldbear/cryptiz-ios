//
//  NetworkManager.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-12.
//

import Foundation

enum NetworkManagerError: Error {
    case invalidURL
    case badRequest // 400
    case unauthorized // 401
    case tooManyRequests // 429
    case internalServerError // 500
    case unexpected(statusCode: Int)
    case unknown
}

final class NetworkManager {
    static let shared = NetworkManager()

    // sandbox api endpoint: Mocked data
    private let baseURL = "https://sandbox-api.coinmarketcap.com"
    private let apiKey = "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c"
    private let latestListings = "/v1/cryptocurrency/listings/latest"

    private var httpHeader: [String : String] {
        ["X-CMC_PRO_API_KEY" : apiKey,
         "Accept" : "application/json"]
    }

    private init() {}

    private func sendRequest(with urlString: String) async throws -> Data? {
        guard let url = URL(string: urlString) else {
            throw NetworkManagerError.invalidURL
        }

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = httpHeader
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...299:
                return data
            case 400:
                throw NetworkManagerError.badRequest
            case 401:
                throw NetworkManagerError.unauthorized
            case 429:
                throw NetworkManagerError.tooManyRequests
            case 500:
                throw NetworkManagerError.internalServerError
            default:
                // default behavior is what?
                throw NetworkManagerError.unexpected(statusCode: httpResponse.statusCode)
            }
        }
        throw NetworkManagerError.unknown
    }

    func fetchListingsLatestCoins() async throws -> [CryptoCoin] {
        do {
            if let coinData = try await sendRequest(with: baseURL + latestListings) {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(Base.self, from: coinData)
                return result.data
            }
        } catch {
            print(">> here's an error :( \(error)")
        }

        throw NetworkManagerError.unknown
    }
}