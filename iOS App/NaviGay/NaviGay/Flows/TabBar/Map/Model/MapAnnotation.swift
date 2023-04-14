//
//  MapAnnotation.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var place: Place
    
    init(place: Place) {
        self.place = place
        self.coordinate = place.coordinate
        self.title = place.name
        self.subtitle = place.details
    }
}
