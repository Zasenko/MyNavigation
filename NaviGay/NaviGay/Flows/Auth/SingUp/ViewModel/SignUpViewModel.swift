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
    
    @Published var showImagePicker: Bool = false
    @Published var isButtonsDisabled = false
    
    @Published var signUpButtonState: AsyncButtonState = .normal
    
    @Published var invalidLoginAttempts = 0
    @Published var invalidPasswordAttempts = 0
    
    let bioPlaceholder = "About you"
}

extension SignUpViewModel {
    // MARK: - Functions
    func SignUpButtonTapped() {
        error = ""
        if !checkLogin() {
            error = "Incorrect email"
            shakeLogin()
            return
        }
        
        let passwordErrors = checkPassword(str: password)
        if !passwordErrors.isEmpty {
            for passwordError in passwordErrors {
                error += passwordError
            }
            shakePassword()
            return
        }
        
        isButtonsDisabled = true
        
        withAnimation(.easeInOut(duration: 0.5)) {
            signUpButtonState = .loading
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
                self.isButtonsDisabled = false
            }
        }
        Task {
            //await self.performAction()
        }
    }
    
    // MARK: - Private Functions
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
