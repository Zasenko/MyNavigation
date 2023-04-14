//
//  CountryCell.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 03.04.23.
//

import SwiftUI

struct CountryCell: View {
    
    @Binding var country: Country
    
    var body: some View {
        HStack(alignment: .center) {
            Text(country.flag)
                .font(.title)
                .padding(.horizontal)
            Text(country.name)
                .font(.title3)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(AppColors.lightGray5)
        .cornerRadius(16)
    }
}
