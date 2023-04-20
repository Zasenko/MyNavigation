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
    case apiError
}


final class NetworkManager {
    
    //MARK: - Private properties
    private let networkMonitor = NetworkMonitor()
    private let api = ApiProperties()
}

extension NetworkManager {
    
    //MARK: - Functions
    func getCountries() async throws -> [Country] {
        guard let url = await api.getAllCountriesUrl() else {
            throw NetworkManagerErrors.bedUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkManagerErrors.invalidData
        }
        guard let decodedResult = try? JSONDecoder().decode(CountriesApi.self, from: data) else {
            throw NetworkManagerErrors.decoderError
        }
        if let resultError = decodedResult.error {
            debugPrint(resultError)
            throw NetworkManagerErrors.apiError
        }
        return decodedResult.countries?.map( { $0.makeCountryModel() })  ?? []
    }
    
    func getCities(countryId: Int) async throws -> [City] {
        guard let url = await api.getAllCitiesUrl(countryId: countryId) else {
            throw NetworkManagerErrors.bedUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkManagerErrors.invalidData
        }
        guard let decodedResult = try? JSONDecoder().decode(CitiesApi.self, from: data) else {
            throw NetworkManagerErrors.decoderError
        }
        if let resultError = decodedResult.error {
            debugPrint(resultError)
            throw NetworkManagerErrors.apiError
        }
        return decodedResult.cities?.map( { $0.makeCityModel() })  ?? []
    }
    
}
