//
//  NetworkManager.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 11.04.23.
//

import Foundation

enum NetworkManagerErrors: Error {
    case noConnection
    case decoderError
    case bedUrl
    case invalidData
}


final class NetworkManager {
    
    //MARK: - Private properties
    
    private let networkMonitor = NetworkMonitor()
    private let api = ApiProperties()
}

extension NetworkManager {
    
    //MARK: - Functions
    
    func getCountries() async throws -> [Country] {
        guard networkMonitor.isInternetConnected == true else {
            throw NetworkManagerErrors.noConnection
        }
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = api.scheme
            components.host = api.host
            components.path = api.getCountriesPath
            return components
        }
        guard let url = urlComponents.url else {
            throw NetworkManagerErrors.bedUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkManagerErrors.invalidData
        }
        guard let decodedResult = try? JSONDecoder().decode([CountryAPI].self, from: data) else {
            throw NetworkManagerErrors.decoderError
        }
        return []//decodedResult
    }
}
