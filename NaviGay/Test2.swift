//
//  Test2.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 29.03.23.
//

import SwiftUI

struct Test2: View {
    
    @State private var test = ""
    var body: some View {
        ScrollView {
            ZStack {
                Image("testParty")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height)
                VStack {
                    Text("I am everywhere (except the software keyboard)")
                    TextField(",kf", text: $test)
                }
            }
        }
                .ignoresSafeArea(SafeAreaRegions.container, edges: [.top, .bottom])
    }
}

struct Test2_Previews: PreviewProvider {
    static var previews: some View {
        Test2()
    }
}
