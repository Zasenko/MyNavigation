//
//  TabBarView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 30.03.23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            MapView(viewModel: MapViewModel())
                .tabItem {
                    Image(systemName: "map.fill")
                }
                .ignoresSafeArea()
            Color.clear
                .tabItem {
                    Image(systemName: "house.fill")
                }
            Color.clear
                .tabItem {
                    Image(systemName: "calendar")
                }
            Color.clear
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
