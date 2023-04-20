//
//  CountryView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

struct CountryView: View {
    
    @StateObject var viewModel: CountryViewModel
    @State private var scrollViewContentOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack() {
                    AsyncImage(url: URL(string: viewModel.country.photo), scale: 1) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.width)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text("Catalan")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.secondary)
                    
                    generateCitiesButtons(in: geometry)
                    
                    Text(viewModel.country.about)
                        .padding()
                        .lineSpacing(12)
                    Text(viewModel.country.lastUpdate?.formatted(date: .complete, time: .complete) ?? "")
                    Text(viewModel.country.flag)
                       
                }
                .padding(.bottom)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationTitle("")
        .toolbarBackground(Color.clear, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("\(viewModel.country.flag)")
                    Text("\(viewModel.country.name)")
                        .foregroundStyle(AppColors.rainbowGradient)
                }
                .font(.largeTitle)
                .bold()
            }
        }
        .background {
            NavigationConfigurator { navigationConfigurator in
                navigationConfigurator.hidesBarsOnSwipe = true
                navigationConfigurator.hidesBottomBarWhenPushed = true
                navigationConfigurator.isToolbarHidden = true
                navigationConfigurator.toolbar.backgroundColor = .orange
            }
        }
    }
    
    private func generateCitiesButtons(in g: GeometryProxy) -> some View {
        viewModel.getCities()
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(viewModel.country.cities) { city in
                createCityButton(for: city.name)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if city.id == viewModel.country.cities.last?.id {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if city.id == viewModel.country.cities.last?.id {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
    }
    
    private func createCityButton(for text: String) -> some View {
        Text(text)
            .bold()
            .foregroundColor(.white)
            .lineLimit(1)
            .padding(.horizontal)
            .padding(.horizontal)
            .frame(height: 50)
            .background(AppColors.red)
            .clipShape(Capsule(style: .continuous))
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: TabBarViewModel(isUserLoggedIn: .constant(true), isUserHaveLocation: .constant(true), viewBilder: ViewBilder()))
    }
}
