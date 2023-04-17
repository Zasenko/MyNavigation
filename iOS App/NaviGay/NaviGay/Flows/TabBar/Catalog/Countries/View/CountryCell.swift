//
//  CountryCell.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

struct CountryCell: View {
    
    //MARK: - Properties
    @Binding var country: Country
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .top) {
            Text(country.flag)
                .font(.title)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.title)
                    .padding(.bottom, 4)
                Text(country.createSmallDescriprion())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.bottom)
    }
}
