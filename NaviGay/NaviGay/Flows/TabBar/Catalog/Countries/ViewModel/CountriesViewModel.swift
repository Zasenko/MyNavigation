//
//  CountriesViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

final class CountriesViewModel: ObservableObject {
    
    @Published var countries: [Country] = []
    private let viewBilder: ViewBilder
    
    init(viewBilder: ViewBilder) {
        self.viewBilder = viewBilder
        countries = testCountries
    }
}

extension CountriesViewModel {
    func makeCountryView(country: Binding<Country>) -> some View  {
        viewBilder.makeCountryView(country: country)
    }
}

let testCountries  = [
    Country(id: 1, name: "Austria", about: "When deciding on the perfect time to visit Spain, it largely depends on two questions: where do you want to go and what do you want to do? This may seem obvious, but due to the vastness of the country and the four seasons, temperature and weather vary greatly. For the top tourist destinations, Madrid and Barcelona, the spring (April/May) and autumn (October/November) are ideal as it’s not too hot.\n\nIf you’re looking to visit for a specific event, then Three Kings Day in January, Carnival in February, Semana Santa in April and pride during the summer should top your list. Traditionally, Spaniards take their summer holiday for several weeks in August leaving cities like Madrid a ghost town. You can find most locals at their summer homes on the coast as central and southern Spain in the summer months (July/August) are typically quite hot and 100℉ (37℃) days are common.", flag: "🇦🇹", photo: Image("testBar"), events: [], regions: []),
    Country(id: 2, name: "Spain", about: "When deciding on the perfect time to visit Spain, it largely depends on two questions: where do you want to go and what do you want to do? This may seem obvious, but due to the vastness of the country and the four seasons, temperature and weather vary greatly. For the top tourist destinations, Madrid and Barcelona, the spring (April/May) and autumn (October/November) are ideal as it’s not too hot.\n\nIf you’re looking to visit for a specific event, then Three Kings Day in January, Carnival in February, Semana Santa in April and pride during the summer should top your list. Traditionally, Spaniards take their summer holiday for several weeks in August leaving cities like Madrid a ghost town. You can find most locals at their summer homes on the coast as central and southern Spain in the summer months (July/August) are typically quite hot and 100℉ (37℃) days are common.", flag: "🇪🇸", photo: Image("testBar"), events: [], regions: []),
    Country(id: 3, name: "USA", about: "When deciding on the perfect time to visit Spain, it largely depends on two questions: where do you want to go and what do you want to do? This may seem obvious, but due to the vastness of the country and the four seasons, temperature and weather vary greatly. For the top tourist destinations, Madrid and Barcelona, the spring (April/May) and autumn (October/November) are ideal as it’s not too hot.\n\nIf you’re looking to visit for a specific event, then Three Kings Day in January, Carnival in February, Semana Santa in April and pride during the summer should top your list. Traditionally, Spaniards take their summer holiday for several weeks in August leaving cities like Madrid a ghost town. You can find most locals at their summer homes on the coast as central and southern Spain in the summer months (July/August) are typically quite hot and 100℉ (37℃) days are common.", flag: "🇺🇸", photo: Image("testBar"), events: [], regions: []),
    Country(id: 4, name: "Poland", about: "When deciding on the perfect time to visit Spain, it largely depends on two questions: where do you want to go and what do you want to do? This may seem obvious, but due to the vastness of the country and the four seasons, temperature and weather vary greatly. For the top tourist destinations, Madrid and Barcelona, the spring (April/May) and autumn (October/November) are ideal as it’s not too hot.\n\nIf you’re looking to visit for a specific event, then Three Kings Day in January, Carnival in February, Semana Santa in April and pride during the summer should top your list. Traditionally, Spaniards take their summer holiday for several weeks in August leaving cities like Madrid a ghost town. You can find most locals at their summer homes on the coast as central and southern Spain in the summer months (July/August) are typically quite hot and 100℉ (37℃) days are common.", flag: "🇵🇱", photo: Image("testBar"), events: [], regions: []),
    Country(id: 5, name: "Italy", about: "When deciding on the perfect time to visit Spain, it largely depends on two questions: where do you want to go and what do you want to do? This may seem obvious, but due to the vastness of the country and the four seasons, temperature and weather vary greatly. For the top tourist destinations, Madrid and Barcelona, the spring (April/May) and autumn (October/November) are ideal as it’s not too hot.\n\nIf you’re looking to visit for a specific event, then Three Kings Day in January, Carnival in February, Semana Santa in April and pride during the summer should top your list. Traditionally, Spaniards take their summer holiday for several weeks in August leaving cities like Madrid a ghost town. You can find most locals at their summer homes on the coast as central and southern Spain in the summer months (July/August) are typically quite hot and 100℉ (37℃) days are common.", flag: "🇮🇹", photo: Image("testBar"), events: [], regions: []) ]
    
