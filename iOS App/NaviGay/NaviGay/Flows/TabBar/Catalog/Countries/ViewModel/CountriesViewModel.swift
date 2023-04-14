//
//  CountriesViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

final class CountriesViewModel: ObservableObject {
    
    @Published var countries: [Country] = []
    private let viewBilder: ViewBilder
    private let networkManager: NetworkManager
    
    init(viewBilder: ViewBilder, networkManager: NetworkManager) {
        self.viewBilder = viewBilder
        self.networkManager = networkManager
        self.getCountries()
    }
}

extension CountriesViewModel {
    
    //MARK: - Functions
    func makeCountryView(country: Binding<Country>) -> some View  {
        viewBilder.makeCountryView(country: country)
    }
    
    //MARK: - Private Functions
    private func getCountries() {
        Task {
            do {
                self.countries = try await networkManager.getCountries()
            } catch {
                print("Error fetching country: \(error)")
            }
        }
        
    }
}
