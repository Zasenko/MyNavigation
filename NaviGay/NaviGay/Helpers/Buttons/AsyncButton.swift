//
//  AsyncButton.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 22.03.23.
//

import SwiftUI

struct AsyncButton<Content>: View where Content: View {
    
    // MARK: - Properties
    
    let backgroundColor: Color
    @Binding var state: AsyncButtonState
    let action: () -> Void
    let content: () -> Content

    // MARK: - View
    
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                switch state {
                case .normal:
                    content()
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.horizontal)
                        .transition(.scale.combined(with: .opacity))
                        .frame(height: 50)
                        .background(backgroundColor)
                        .clipShape(Capsule())
                case .loading:
                    ProgressView()
                case .success:
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.green)
                        .bold()
                case .failure:
                    Image(systemName: "xmark")
                        .foregroundColor(AppColors.red)
                        .bold()
                }
            }
            .frame(height: 50)
            .disabled(state == .loading || state == .success || state == .failure)
        }
    }
}
