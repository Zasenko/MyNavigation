//
//  LoginViewModel.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 23.03.23.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginButtonState: AsyncButtonState = .normal
    @Published var error = ""
    @Published var invalidLoginAttempts = 0
    @Published var invalidPasswordAttempts = 0
    @Published var isSkipButtonAvailable = true
    @Published var isSignUpViewOpen = false
}

extension LoginViewModel {
    // MARK: - Functions
    
    func loginButtonTapped() {
        isSkipButtonAvailable = false
        
        error = ""
        let loginErrors = checkLogin()
        if loginErrors == false {
            error = "Incorrect email"
            shakeLogin()
            return
        }
        
        let passwordErrors = checkPassword(str: password)
        if passwordErrors.isEmpty {
            
        } else {
            for passwordError in passwordErrors {
                error += passwordError
            }
            shakePassword()
            return
        }
        withAnimation(.easeInOut(duration: 0.4)) {
            loginButtonState = .loading
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 0.4)) {
                self.loginButtonState = .success
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut(duration: 0.4)) {
                self.loginButtonState = .normal
                self.isSkipButtonAvailable = true
            }
        }
        Task {
            //await self.performAction()
        }
    }
    
    func skipButtonTapped() {}
    func signUpButtonTapped() {
        isSignUpViewOpen = true
    }
    
    func signUpViewDismissed() {
        isSignUpViewOpen = false
    }
    
    private func checkLogin() -> Bool {
        invalidLoginAttempts = 0
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
 
    }
    
    private func checkPassword(str: String) -> [String] {
        invalidPasswordAttempts = 0
        var errors: [String] = []
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: str)){
            errors.append("least one uppercase\n")
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: str)){
            errors.append("least one digit\n")
        }

//        if(!NSPredicate(format:"SELF MATCHES %@", ".*[!&^%$#@()/]+.*").evaluate(with: str)){
//            errors.append("least one symbol\n")
//        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: str)){
            errors.append("least one lowercase\n")
        }
        
        if(str.count < 8){
            errors.append("min 8 characters total\n")
        }
        return errors
    }
    
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
