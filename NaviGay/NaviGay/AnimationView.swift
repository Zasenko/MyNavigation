//
//  AnimationView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 21.03.23.
//

import SwiftUI

struct AppImages {
    static let logoFull = Image("logoFull")
}

struct AppColors {
    static let red = Color("red")
}

struct TestView: View {
    
    var body: some View {
        NavigationView {
            ScrollView{
                HStack {
                    AppImages.logoFull
                    Text("Hadr on Bar Vienna")
                }
                Text("Hadr on Bar Vienna")
                Text("Hadr on Bar Vienna")
                Text("Hadr on Bar Vienna")
                NavigationLink {
                    Color.green
                } label: {
                    Text("Hadr on Bar Vienna")
                }
                
            }
            .navigationBarTitle(Text("😈") + Text("World").font(.largeTitle))
//            .toolbarBackground(.visible, for: ToolbarPlacement.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "mappin.circle")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "mappin.circle")
                        }
                    }

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart.fill")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "mappin.circle.fill")
                        }
                    }

                }
            }
            .tint(AppColors.red)
            
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
