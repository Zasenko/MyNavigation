//
//  SignUpViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 22.03.23.
//

import SwiftUI

final class SignUpViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var bio: String = ""
    @Published var image: UIImage?
    @Published var error = ""
    
    @Published var signUpButtonState: AsyncButtonState = .normal
    
    @Published var invalidLoginAttempts = 0
    @Published var invalidPasswordAttempts = 0
    @Published var invalidNameAttempts = 0
    
    @Published var allViewsDisabled: Bool = false
    @Published var showImagePicker: Bool = false
    
    private let authManager: AuthManagerProtocol
    
    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
    }
}

extension SignUpViewModel {
    // MARK: - Functions
    func SignUpButtonTapped() {
        error = ""
        invalidLoginAttempts = 0
        invalidPasswordAttempts = 0
        invalidNameAttempts = 0
        
        authManager.check(email: email, password: password) { [weak self] result in
            switch result {
            case .success(_):
                self?.allViewsDisabled = true
                withAnimation(.easeInOut(duration: 0.5)) {
                    self?.signUpButtonState = .loading
                }
            case .failure(let error):
                switch error {
                case .wrongEmail:
                    self?.error = "Incorrect email"
                    self?.shakeLogin()
                default:
                    self?.error = "Wrong password"
                    self?.shakePassword()
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.signUpButtonState = .success
            //    self.isButtonsDisabled = false
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.signUpButtonState = .failure
          //      self.isButtonsDisabled = false
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.signUpButtonState = .normal
                self.allViewsDisabled = false
            }
        }
        Task {
            //await self.performAction()
        }
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
