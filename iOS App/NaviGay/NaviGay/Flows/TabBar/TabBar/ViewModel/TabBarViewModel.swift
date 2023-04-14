//
//  TabBarViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 31.03.23.
//

import SwiftUI

final class TabBarViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var items: [TabBarButton] = []
    @Published var selectedItem = 0
    @Binding var isUserLoggedIn: Bool
    @Binding var isUserHaveLocation: Bool
    let viewBilder: ViewBilder
    
    // MARK: - Inits
    init(isUserLoggedIn: Binding<Bool>, isUserHaveLocation: Binding<Bool>, viewBilder: ViewBilder) {
        self._isUserLoggedIn = isUserLoggedIn
        self._isUserHaveLocation = isUserHaveLocation
        self.viewBilder = viewBilder
        createTabbar()
    }
}

extension TabBarViewModel {
    // MARK: - Functios
    func buttonTappde(index: Int) {
        selectedItem = index
    }

    // MARK: - Private Functions
    private func createTabbar() {
        items = [
            TabBarButton(id: 1,title: "Map", img: AppImages.iconMap, view: AnyView(viewBilder.makeMapView())),
            TabBarButton(id: 2, title: "Calendar", img: AppImages.iconCalendar, view: AnyView(viewBilder.makeCalendarView())),
            TabBarButton(id: 3, title: "Search", img: AppImages.iconSearch, view: AnyView(viewBilder.makeSearchView())),
            TabBarButton(id: 4, title: "User", img: AppImages.iconPerson, view: AnyView(viewBilder.makeUserView()))
        ]
    }
}
