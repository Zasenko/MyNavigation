//
//  NaviGayApp.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 21.03.23.
//

import SwiftUI

@main
struct NaviGayApp: App {
    
    @State private var isUserLoggedIn = true
    @State private var isUserHaveLocation = true
    @State private var isAnimationFinished = false
    let viewBilder = ViewBilder()
    
    var body: some Scene {
        WindowGroup {
            //LogoAnimationView(isAnimationFinished: $isAnimationFinished)
            
            TabBarView(viewModel: TabBarViewModel(isUserLoggedIn: $isUserLoggedIn, isUserHaveLocation: $isUserHaveLocation, viewBilder: viewBilder))
            //AboutUserView(viewModel: AboutUserViewModel())
            //    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
