//
//  MapCoordinatorView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import SwiftUI
import MapKit

struct MapCoordinatorView: UIViewRepresentable {
    
    @ObservedObject var viewModel: MapViewModel
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(viewModel.annotations)
        uiView.showAnnotations(viewModel.annotations, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapCoordinatorView
        
        init(_ parent: MapCoordinatorView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView.canShowCallout = true
            let button = UIButton(type: .detailDisclosure)
            annotationView.rightCalloutAccessoryView = button
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation as? MapAnnotation {
                parent.viewModel.selectedPlace = annotation.place
            }
        }
    }
}


struct MapViewMapKit_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: TabBarViewModel(isUserLoggedIn: .constant(true), isUserHaveLocation: .constant(true), viewBilder: ViewBilder()))
    }
}
