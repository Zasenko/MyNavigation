//
//  MapViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    
    @Published var annotations: [MapAnnotation] = []
    @Published var selectedPlace: Place?
    
    init() {
        loadPlaces()
    }
    
    func loadPlaces() {
        // Add 10 sample places and annotations
        for i in 1...10 {
            let coordinate = CLLocationCoordinate2D(latitude: 37.7749 + Double(i)/100, longitude: -122.4194 + Double(i)/100)
            let place = Place(id: i, name: "Place \(i)", coordinate: coordinate, details: "This is Place \(i)")
            let annotation = MapAnnotation(place: place)
            annotations.append(annotation)
        }
    }
}
