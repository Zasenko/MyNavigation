//
//  CountryViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

final class CountryViewModel: ObservableObject {
    
    @Binding var country: Country
    
    init(country: Binding<Country>) {
        self._country = country
    }
}
