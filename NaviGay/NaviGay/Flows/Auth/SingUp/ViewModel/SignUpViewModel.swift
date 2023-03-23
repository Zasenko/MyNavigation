//
//  SignUpViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 22.03.23.
//

import SwiftUI

enum AsyncButtonState {
    case normal, loading, success, failure
}

final class SignUpViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var image: UIImage?
    @Published var showImagePicker: Bool = false
    @Published var signUpButtonState: AsyncButtonState = .normal
    @Published var error = ""
    @Published var invalidLoginAttempts = 0
    @Published var invalidPasswordAttempts = 0
    @Published var isCancelButtonAvailable = true
}

extension SignUpViewModel {
    func loginButtonTapped() {
        withAnimation(.easeInOut(duration: 0.4)) {
            signUpButtonState = .loading
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 0.4)) {
                self.signUpButtonState = .failure
            }
        }
        Task {
            //await self.performAction()
        }
    }
}
