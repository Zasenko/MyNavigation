//
//  LoginView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 23.03.23.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel = LoginViewModel()
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Spacer()
            Text("Login")
                .font(.system(size: 40)).bold()
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.secondary)
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
            }
            .padding()
            .background(AppColors.lightGray)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(viewModel.invalidLoginAttempts == 0 ? .clear : .red)
            }
            .modifier(ShakeEffect(animatableData: CGFloat(viewModel.invalidLoginAttempts)))
            .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.secondary)
                SecureField("Password", text: $viewModel.password)
            }
            .padding()
            .background(AppColors.lightGray)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(viewModel.invalidPasswordAttempts == 0 ? .clear : .red)
            }
            .modifier(ShakeEffect(animatableData: CGFloat(viewModel.invalidPasswordAttempts)))
            HStack {
                Spacer()
                Button {
                    viewModel.skipButtonTapped()
                } label: {
                    Text("Forget password?")
                        .padding(.vertical)
                }
            }
            HStack(spacing: 10) {
                AsyncButton(backgroundColor: AppColors.red,
                            state: $viewModel.loginButtonState) {
                    viewModel.loginButtonTapped()
                } content: {
                    Text("Login")
                }
                Button {
                    viewModel.skipButtonTapped()
                } label: {
                    Text("Skip")
                        .padding()
                        .foregroundColor(.gray)
                }
                .disabled(viewModel.isSkipButtonAvailable)
                
            }
            .padding(.bottom, 20)
            
            Text(viewModel.error)
                .font(.callout)
                .foregroundColor(AppColors.red)
                .frame(height: 20)
            Spacer()
            HStack {
                Text("Don't have an account?")
                Button {
                    viewModel.signUpButtonTapped()
                } label: {
                    Text("Sign Up")
                }
            }
        }
        .padding()
        .fullScreenCover(isPresented: $viewModel.isSignUpViewOpen) {
            viewModel.signUpViewDismissed()
        } content: {
            SignUpView()
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
