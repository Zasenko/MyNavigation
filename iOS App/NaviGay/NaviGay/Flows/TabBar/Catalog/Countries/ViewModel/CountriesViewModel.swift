//
//  CountriesViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

final class CountriesViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var countries: [Country] = []
    
    //MARK: - Private Properties
    private let viewBilder: ViewBilder
    private let networkManager: NetworkManager
    
    //MARK: - Inits
    init(viewBilder: ViewBilder, networkManager: NetworkManager) {
        self.viewBilder = viewBilder
        self.networkManager = networkManager
    }
}

extension CountriesViewModel {
    
    //MARK: - Functions
    func makeCountryView(country: Binding<Country>) -> some View  {
        viewBilder.makeCountryView(country: country)
    }
    
    @MainActor
    func getCountries() {
        if countries.isEmpty {
            Task {
                do {
                    self.countries = try await networkManager.getCountries()
                } catch {
                    print("Error fetching country: \(error)")
                }
            }
        }
    }
}
