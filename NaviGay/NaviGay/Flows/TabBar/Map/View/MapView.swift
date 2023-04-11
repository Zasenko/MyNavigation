//
//  MapView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

struct MapView: View {
    
    @StateObject var viewModel: MapViewModel
    
    var body: some View {
        ZStack {
            MapCoordinatorView(viewModel: viewModel)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: TabBarViewModel(isUserLoggedIn: .constant(true), isUserHaveLocation: .constant(true), viewBilder: ViewBilder()))
    }
}
