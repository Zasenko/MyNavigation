//
//  Test2.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 29.03.23.
//

import SwiftUI

struct Test2: View {
    var country: Country2
    @State var presentet = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Image(country.photo).resizable().scaledToFit()) {
                    ForEach(country.regions, id: \.name) { region in
                        Section(header: Text(region.name)) {
                            ForEach(region.cities) { city in
                                Text(city.name)
                                    .background(.red)
                            }
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationBarTitle(country.name)
            .navigationBarItems(trailing: Image(systemName: "info.circle").imageScale(.large).padding().popover(
                isPresented: $presentet, attachmentAnchor: .point(.zero),
                content: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About \(country.name)")
                            .font(.headline)
                        Text("Austria is a country in Central Europe. It is bordered by Germany to the northwest, the Czech Republic to the north, Slovakia to the northeast, Hungary to the east, Slovenia and Italy to the south, and Switzerland and Liechtenstein to the west.")
                        Text("The official language is German.")
                        Text("The currency is the euro.")
                    }
                    .padding()
                }
            ))
        }
    }
}

struct Test2_Previews: PreviewProvider {
    static var previews: some View {
        Test2(country: .austria)
    }
}

import Foundation

struct City2: Identifiable {
    var id = UUID()
    var name: String
}

struct Region2 {
    var name: String
    var cities: [City2]
}

struct Country2 {
    var name: String
    var photo: String
    var regions: [Region2]
    
    static let austria = Country2(
        name: "Austria",
        photo: "testBar",
        regions: [
            Region2(
                name: "Vienna",
                cities: [
                    City2(name: "Vienna"),
                    City2(name: "Graz"),
                    City2(name: "Linz"),
                    City2(name: "Salzburg"),
                    City2(name: "Innsbruck"),
                    City2(name: "Klagenfurt")
                ]
            ),
            Region2(
                name: "Upper Austria",
                cities: [
                    City2(name: "Linz"),
                    City2(name: "Steyr"),
                    City2(name: "Wels"),
                    City2(name: "Enns")
                ]
            ),
            Region2(
                name: "Lower Austria",
                cities: [
                    City2(name: "St. Pölten"),
                    City2(name: "Krems"),
                    City2(name: "Wiener Neustadt"),
                    City2(name: "Baden")
                ]
            )
        ]
    )
}

