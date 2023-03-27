//
//  AsyncButton.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 22.03.23.
//

import SwiftUI

enum AsyncButtonState {
    case normal, loading, success, failure
}

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

                case .loading:
                    ProgressView()
                        .padding(.horizontal)
                        .foregroundColor(.white)
                case .success:
                    Image(systemName: "checkmark")
                        .bold()
                        .padding(.horizontal)
                        .foregroundColor(.green)
                case .failure:
                    Image(systemName: "xmark")
                        .bold()
                        .padding(.horizontal)
                        .foregroundColor(AppColors.red)
                }
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.horizontal)
            .frame(height: 50)
//            .background (backgroundColor)
//            .background {
//                switch state {
//                case .normal, .loading:
//                    backgroundColor
//                case .success:
//                    Color.gray
//                case .failure:
//                    AppColors.red
//                }
//            }
            .background {
                state == .normal ? backgroundColor : Color.clear
            }
            .clipShape(Capsule(style: .continuous))
            .disabled(state == .loading || state == .success || state == .failure)
        }
    }
}
