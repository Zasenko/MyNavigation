//
//  NaviGayApp.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 21.03.23.
//

import SwiftUI

@main
struct NaviGayApp: App {
   // let persistenceController = PersistenceController.sharedbounds

    var body: some Scene {
        WindowGroup {
            AboutUserView(viewModel: AboutUserViewModel())
            //    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
