//
//  City.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import SwiftUI

struct Region {
    let id: UInt
    var name: String
    var about: String
    var photo: Image
    var cities: [City]
    var places: [Place]
    var events: [Event]
}

struct City {
    let id: UInt
    
    var name: String
    var about: String
    
    var photo: Image
    var photos: [Image]
    
    var reasonsWhy: [String] //?
    var thingsToDo: [String] //?
    
    var places: [Place]
    var events: [Event]
}
