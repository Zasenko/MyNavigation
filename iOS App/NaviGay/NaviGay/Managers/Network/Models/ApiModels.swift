//
//  ApiModels.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 16.04.23.
//

import Foundation

struct CountriesApi: Codable {
    let error: String?
    let countries: [CountryApi]?
}

struct CountryApi: Identifiable, Codable {
    let id: UInt
    let name: String
    let about: String
    let flag: String
    let photo: String
    let isActive: UInt
    let regions: [RegionApi]
    let events: [EventApi]
    let places: [PlaceApi]
    let lastUpdate: String
    
    func makeCountryModel() -> Country {
        
        let dayFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            return formatter
        }()
        
        let country = Country(id: id, name: name, about: about, flag: flag, photo: photo, events: [], regions: [], isActive: isActive == 1 ? true : false, lastUpdate: lastUpdate.isEmpty ? nil : dayFormat.date(from: lastUpdate))
        
        return country
    }
}

struct RegionApi: Identifiable, Codable {
    let id: UInt
    let name: String
    let isActive: UInt
    let lastUpdate: String
    let cities: [CityApi]
    let places: [PlaceApi]
    let events: [EventApi]
}

struct CityApi: Identifiable, Codable {
    let id: UInt
    let name: String
    let about: String
    let photo: String
    let isActive: UInt
    let lastUpdate: String
    let places: [PlaceApi]
    let events: [EventApi]
}

struct PlaceApi: Identifiable, Codable {
    let id: UInt
    let name: String
    let type: String //TODO!
    let tags: [String]//TODO!
    let about: String
    let photo: String
    let photos: [String]
    let adress: String
    let latitude: Double
    let longitude: Double
    let workingTime: [String]//TODO
    let www: String
    let fb: String
    let instagram: String
    let phone: String
    let isActive: UInt
    let comments: [String]//TODO
    let lastUpdate: String
}

struct EventApi: Identifiable, Codable {
    let id: UInt
    let name: String
    let type: String //TODO!
    let tags: [String]//TODO!
    let about: String
    let cover: String
    let adress: String
    let latitude: Double
    let longitude: Double
    let start: String
    let finish: String
    let tickets: String
    let www: String
    let fb: String
    let instagram: String
    let phone: String
    let isActive: UInt
    let lastUpdate: String
}

