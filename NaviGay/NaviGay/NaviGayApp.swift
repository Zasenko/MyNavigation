//
//  NaviGayApp.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 21.03.23.
//

import SwiftUI

@main
struct NaviGayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
