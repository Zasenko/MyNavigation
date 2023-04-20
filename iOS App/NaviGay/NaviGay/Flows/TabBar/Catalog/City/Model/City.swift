//
//  City.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import SwiftUI
//
//struct Region {
//    let id: Int
//    var name: String
//    var about: String
//    var photo: Image
//    var cities: [City]
//    var places: [Place]
//    var events: [Event]
//}

struct City: Identifiable {
    let id: Int
    
    var name: String
    var about: String
    
    var photo: String
    var photos: [String]
    
    let isActive: Bool
    let lastUpdate: Date?
    
    let region_id: Int
    let region_name: String
    
    var reasonsWhy: [String] //?
    var thingsToDo: [String] //?
    
    var places: [Place]
    var events: [Event]
}
