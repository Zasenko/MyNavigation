//
//  LoginViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 23.03.23.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    @Published var loginButtonState: AsyncButtonState = .normal

    @Published var invalidLoginAttempts = 0
    @Published var invalidPasswordAttempts = 0

    @Published var allViewsDisabled = false
    @Published var isSignUpViewOpen = false
    
    private let authManager: AuthManagerProtocol = AuthManager()
}

extension LoginViewModel {
    
    // MARK: - Functions
    func loginButtonTapped() {
        error = ""
        invalidLoginAttempts = 0
        invalidPasswordAttempts = 0
        
        allViewsDisabled = true
        authManager.check(email: email, password: password) { [weak self] result in
            switch result {
            case .success(_):
               // self?.allViewsDisabled = true
                withAnimation(.easeInOut(duration: 0.5)) {
                    self?.loginButtonState = .loading
                }
            case .failure(let error):
                switch error {
                case .wrongEmail:
                    self?.error = "Incorrect email"
                    self?.shakeLogin()
                    return
                default:
                    self?.error = "Wrong password"
                    self?.shakePassword()
                    return
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.loginButtonState = .success
            //    self.isButtonsDisabled = false
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.loginButtonState = .failure
          //      self.isButtonsDisabled = false
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.loginButtonState = .normal
                self.allViewsDisabled = false
            }
        }
        Task {
            //await self.performAction()
        }
    }
    
    func skipButtonTapped() {
        isSignUpViewOpen = true
    }
    func signUpButtonTapped() {
        isSignUpViewOpen = true
    }
    
    func signUpViewDismissed() {
        isSignUpViewOpen = false
    }
    
    func makeSignUpView() -> some View {
        let viewModel = SignUpViewModel(authManager: authManager)
        return SignUpView(viewModel: viewModel)
    }
    
    // MARK: - Private Functions

    private func shakeLogin() {
        withAnimation(.default) {
            invalidLoginAttempts += 1
        }
    }
    
    private func shakePassword() {
        withAnimation(.default) {
            invalidPasswordAttempts += 1
        }
    }
}
