//
//  User.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import Foundation

struct User: Identifiable {
    let id: Int
    var name: String
    var bio: String
    var photo: ImagePicker
    var instagram: String
    var blockedPlaces: [Place]
    var blockedEvents: [Event]
    var blockedUsers: [User]
    var lastUpdate: Date
}
