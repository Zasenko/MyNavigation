//
//  Place.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

//import Foundation
//
//struct Place {
//    var id: Int
//}

import Foundation
import MapKit

struct Place: Identifiable {
    let id: Int
    let name: String
    let coordinate: CLLocationCoordinate2D
    let details: String
}
