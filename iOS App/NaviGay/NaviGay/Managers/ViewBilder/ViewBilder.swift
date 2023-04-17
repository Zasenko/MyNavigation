//
//  ViewBilder.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

final class ViewBilder {
    
    //MARK: - Private properties
    private let networkManager = NetworkManager()
}

extension ViewBilder {
    
    //MARK: - Functions
    func makeMapView() -> some View {
        let viewModel = MapViewModel()
        return MapView(viewModel: viewModel)
    }
    
    func makeCalendarView() -> some View {
        return Color.orange
    }
    
    func makeSearchView() -> some View {
        return CountriesView(viewModel: CountriesViewModel(viewBilder: self, networkManager: self.networkManager))
    }
    
    func makeUserView() -> some View {
        List(Range(1...30), id: \.self) { int in
            Text("\(int)")
                .padding()
                .padding()
                .background(Color.black)
        }
    }
    func makeCountryView(country: Binding<Country>) -> some View {
        return CountryView(viewModel: CountryViewModel(country: country))
    }
}
