//
//  CountryViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

final class CountryViewModel: ObservableObject {
    
    //MARK: - Properties
    @Binding var country: Country
    @Published var buttonSizeWidth: CGFloat = 100
    
    //MARK: - Private Properties
    private let networkManager: NetworkManager
    
    //MARK: - Inits
    init(country: Binding<Country>, networkManager: NetworkManager) {
        self._country = country
        self.networkManager = networkManager
    }
}

extension CountryViewModel {
    
    //MARK: - Functions
    @MainActor
    func getCities() {
        if country.cities.isEmpty {
            Task {
                do {
                    self.country.cities = try await networkManager.getCities(countryId: country.id)
                } catch {
                    print("Error fetching country: \(error)")
                }
            }
        }
    }
}
