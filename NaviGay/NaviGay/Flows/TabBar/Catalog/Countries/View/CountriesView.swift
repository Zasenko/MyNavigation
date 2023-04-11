//
//  CountriesView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

struct CountriesView: View {
    
    @StateObject var viewModel: CountriesViewModel
    
    var body: some View {
        NavigationStack {
            List($viewModel.countries) { country in
                ZStack {
                    NavigationLink {
                        viewModel.makeCountryView(country: country)
                    } label: {
                        EmptyView()
                    }
                    .opacity(0.0)
                    .buttonStyle(PlainButtonStyle())
                    
                    CountryCell(country: country)
                }
                .buttonStyle(PlainButtonStyle())
                .listRowSeparator(.hidden)
                .listRowBackground(AppColors.background)
            }
            .listStyle(.plain)
            .navigationTitle("Countries")
            .navigationBarTitleDisplayMode(.inline)
            .background(AppColors.background)
            .background {
                NavigationConfigurator { navigationConfigurator in
                    navigationConfigurator.hidesBarsOnSwipe = true
                    navigationConfigurator.hidesBottomBarWhenPushed = true
                    navigationConfigurator.isToolbarHidden = true
                    navigationConfigurator.toolbar.backgroundColor = .orange
                }
            }
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(viewModel: CountriesViewModel(viewBilder: ViewBilder()))
    }
}
