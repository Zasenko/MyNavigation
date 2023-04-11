//
//  ViewBilder.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

final class ViewBilder {
}

extension ViewBilder {
    func makeMapView() -> some View {
        let viewModel = MapViewModel()
        return MapView(viewModel: viewModel)
    }
    
    func makeCalendarView() -> some View {
        return Color.orange
    }
    
    func makeSearchView() -> some View {
        let viewModel = CountriesViewModel(viewBilder: self)
        return CountriesView(viewModel: viewModel)
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
        let viewModel = CountryViewModel(country: country)
        return CountryView(viewModel: viewModel)
    }
}
