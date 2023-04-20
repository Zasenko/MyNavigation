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
    let id: Int
    let name: String
    let about: String
    let flag: String
    let photo: String
    let isActive: Int
    let lastUpdate: String
    
    func makeCountryModel() -> Country {
        
        let dayFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            return formatter
        }()
        
        let country = Country(id: id, name: name, about: about, flag: flag, photo: photo, events: [], isActive: isActive == 1 ? true : false, lastUpdate: lastUpdate.isEmpty ? nil : dayFormat.date(from: lastUpdate))
        
        return country
    }
}

struct CitiesApi: Codable {
    let error: String?
    let cities: [CityApi]?
}

struct CityApi: Identifiable, Codable {
    let id: Int
    let name: String
    let about: String
    let photo: String
    let isActive: Int
    let lastUpdate: String
    let region_id: Int
    let region_name: String
    
    func makeCityModel() -> City {
        
        let dayFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            return formatter
        }()
        
        let country = City(id: id, name: name, about: about, photo: photo, photos: [], isActive: isActive == 1 ? true : false, lastUpdate: lastUpdate.isEmpty ? nil : dayFormat.date(from: lastUpdate), region_id: region_id, region_name: region_name, reasonsWhy: [], thingsToDo: [], places: [], events: [])
        return country
    }
}

struct PlaceApi: Identifiable, Codable {
    let id: Int
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
    let isActive: Int
    let comments: [String]//TODO
    let lastUpdate: String
}

struct EventApi: Identifiable, Codable {
    let id: Int
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
    let isActive: Int
    let lastUpdate: String
}

