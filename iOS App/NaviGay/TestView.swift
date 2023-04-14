//
//  TestView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 21.03.23.
//

import SwiftUI

struct TestView: View {
    
    var body: some View {
        TabView {
            TestView3()
                .edgesIgnoringSafeArea(.top)
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            Color.red
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
        }
        
    }
}


struct TestView3: View {
    
//    init() {
//        guard let customFont = UIFont(name: "SFProDisplay-Light", size: 50) else {
//            return
//        }
//        guard let customFont2 = UIFont(name: "SFProDisplay-Light", size: 20) else {
//            return
//        }
//        let appearance = UINavigationBarAppearance()
//
//        appearance.configureWithTransparentBackground()
//        appearance.largeTitleTextAttributes = [.font : customFont,
//                                               NSAttributedString.Key.foregroundColor : UIColor.white]
//        appearance.titleTextAttributes = [.font : customFont2,
//                                          NSAttributedString.Key.foregroundColor : UIColor.white]
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        UINavigationBar.appearance().standardAppearance = appearance
//        UIScrollView.appearance().bounces = true
//    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Image("testBar")
                        .resizable()
                        .scaledToFit()
                    HStack {
                        AppImages.logoFull
                        Text("Hadr on Bar Vienna")
                    }
                }
                Text("Failed to load the CustomFont-Light font.")
                    .font(AppFonts.largeTitleLight)
                Text("Этот текст я придумал только что")
                    .font(AppFonts.largeTitle)
                Text("Этот текст я придумал только что")
                    .font(AppFonts.normalText)
                Text("Нормальный текст")
                    .font(AppFonts.captionText)
                NavigationLink {
                    TestView2()
                } label: {
                    Text("Hadr on Bar Vienna")
                }
                Spacer()
            }
            .background(AppColors.background)
            .edgesIgnoringSafeArea(.top)
         //   .navigationBarTitle("Menu", displayMode: .large)
            .navigationBarTitleDisplayMode(.inline)
        //    .navigationBarTitle(Text("😈 World an more").font(AppFonts.largeTitleLight), displayMode: .large)
         //   .navigationBarTitle(Text("World an more").font(AppFonts.normalText), displayMode: .inline)
          //.navigationBarTitle (Text("Dashboard"), displayMode: .inline)
            // .navigationBarTitle("😈 World an more")
            .toolbar(.visible, for: .navigationBar)
         
            .toolbarBackground(AppColors.background, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("😈 World an more")
                        .font(AppFonts.largeTitleLight)
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
struct TestView2: View {
    var body: some View {
        Color.green
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Test View 2")
    }
}
