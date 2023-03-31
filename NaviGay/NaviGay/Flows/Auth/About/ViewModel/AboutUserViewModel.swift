//
//  AboutUserViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 29.03.23.
//

import SwiftUI

final class AboutUserViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var name: String = ""
    @Published var bio: String = ""
    @Published var image: UIImage?
    @Published var error = ""
    
    @Published var signUpButtonState: AsyncButtonState = .normal
    
    @Published var invalidNameAttempts = 0
    
    @Published var allViewsDisabled: Bool = false
    @Published var showImagePicker: Bool = false
}

extension AboutUserViewModel {
    // MARK: - Functions
    func SaveButtonTapped() {
        error = ""
        invalidNameAttempts = 0
        
//        authManager.check(email: email, password: password) { [weak self] result in
//            switch result {
//            case .success(_):
//                self?.allViewsDisabled = true
//                withAnimation(.easeInOut(duration: 0.5)) {
//                    self?.signUpButtonState = .loading
//                }
//            case .failure(let error):
//                switch error {
//                case .wrongEmail:
//                    self?.error = "Incorrect email"
//                    self?.shakeLogin()
//                default:
//                    self?.error = "Wrong password"
//                    self?.shakePassword()
//                }
//            }
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            withAnimation(.easeInOut(duration: 0.5)) {
//                self.signUpButtonState = .success
//                //    self.isButtonsDisabled = false
//            }
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            withAnimation(.easeInOut(duration: 0.5)) {
//                self.signUpButtonState = .failure
//                //      self.isButtonsDisabled = false
//            }
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//            withAnimation(.easeInOut(duration: 0.5)) {
//                self.signUpButtonState = .normal
//                self.allViewsDisabled = false
//            }
//        }
//        Task {
//            //await self.performAction()
//        }
    }
}
