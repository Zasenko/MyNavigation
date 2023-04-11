//
//  Country.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import SwiftUI

struct Country: Identifiable {
    let id: UInt
    let name: String
    let about: String
    let flag: String
    var photo: Image
    var events: [Event]
    var regions: [Region]
}

