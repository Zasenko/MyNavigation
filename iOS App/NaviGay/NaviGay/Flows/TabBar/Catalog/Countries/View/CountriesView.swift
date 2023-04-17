//
//  CountriesView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

struct CountriesView: View {
    
    //MARK: - Proreties
    @StateObject var viewModel: CountriesViewModel
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            list
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Countries")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(AppColors.rainbowGradient)
                    }
                }
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
    
    //MARK: - Views
    private var list: some View {
        List {
            Section {
                Color.clear
                    .frame(height: 20)
                    .listRowSeparator(.hidden)
            }
            Section {
                ForEach($viewModel.countries) { country in
                    
                    NavigationLink {
                        viewModel.makeCountryView(country: country)
                        
                    } label: {
                        CountryCell(country: country)
                    }
                }
                .listRowBackground(AppColors.background)
            }
        }
        .listStyle(.plain)
        .onAppear() {
            viewModel.getCountries()
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(viewModel: CountriesViewModel(viewBilder: ViewBilder(), networkManager: NetworkManager()))
    }
}
