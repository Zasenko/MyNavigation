//
//  ContentView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 21.03.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
            Text("Select an item")
            
        }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
