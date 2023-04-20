//
//  Country.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import SwiftUI

struct Country: Identifiable{
    let id: Int
    var name: String
    var about: String
    let flag: String
    var photo: String
    var cities: [City] = []
    var events: [Event] = []
    var isActive: Bool
    var lastUpdate: Date?
    
    func createSmallDescriprion() -> String {
        if let description = about.split(separator: ".").first {
            return "\(description)."
        } else {
            return ""
        }
    }
}
