//
//  CountryView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

struct CountryView: View {
    
    @StateObject var viewModel: CountryViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                viewModel.country.photo
                    .resizable()
                    .scaledToFit()
                Text(viewModel.country.about)
                    .padding()
                    .lineSpacing(12)
            }
        }
//        List($viewModel.country.regions, rowContent: { <#Binding<Identifiable>#> in
//            <#code#>
//        })
        
        .navigationTitle("\(viewModel.country.flag) \(viewModel.country.name)")
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

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(viewModel: CountryViewModel(country: .constant(
            Country(id: 1,
                    name: "Austria",
                    about: "When deciding on the perfect time to visit Spain, it largely depends on two questions: where do you want to go and what do you want to do? This may seem obvious, but due to the vastness of the country and the four seasons, temperature and weather vary greatly. For the top tourist destinations, Madrid and Barcelona, the spring (April/May) and autumn (October/November) are ideal as it’s not too hot.\n\nIf you’re looking to visit for a specific event, then Three Kings Day in January, Carnival in February, Semana Santa in April and pride during the summer should top your list. Traditionally, Spaniards take their summer holiday for several weeks in August leaving cities like Madrid a ghost town. You can find most locals at their summer homes on the coast as central and southern Spain in the summer months (July/August) are typically quite hot and 100℉ (37℃) days are common.",
                    flag: "🇦🇹",
                    photo: Image("testBar"),
                    events: [], regions: [Region(id: 1, name: "Tyrol", about: "бла бла бла", photo: Image("testBar"), cities: [City(id: 1,
                             name: "Salzburg",
                             about: ",kf ,kf ,kf",
                             photo: Image("testBar"),
                             photos: [],
                             reasonsWhy: [],
                             thingsToDo: [],
                             places: [],
                             events: [])], places: [], events: [])])
        )))
    }
}
