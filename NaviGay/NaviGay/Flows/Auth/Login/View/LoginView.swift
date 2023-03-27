//
//  LoginView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 23.03.23.
//

import SwiftUI

struct LoginView: View {
    
    private enum Field: Hashable {
        case email
        case password
    }
    
    // MARK: - Properties
    
    @StateObject var viewModel = LoginViewModel()
    @FocusState private var focusedField: Field?
    
    // MARK: - View
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("Login")
                    .font(.system(size: 40)).bold()
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.secondary)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .email)
                        .onSubmit {
                            focusedField = .password
                        }
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
                        .focused($focusedField, equals: .password)
                        .onSubmit {
                            focusedField = nil
                        }
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
                
                Button {
                    viewModel.skipButtonTapped()
                } label: {
                    Text("Forget password?")
                }
                .disabled(viewModel.isButtonsDisabled)
                .padding(.bottom)
                .padding(.bottom)
                
                HStack(spacing: 10) {
                    AsyncButton(backgroundColor: AppColors.red,
                                state: $viewModel.loginButtonState) {
                        viewModel.loginButtonTapped()
                    } content: {
                        Text("Login")
                    }
                    .disabled(viewModel.isButtonsDisabled)
                    
                    Button {
                        viewModel.skipButtonTapped()
                    } label: {
                        Text("Skip")
                            .padding()
                    }
                    .disabled(viewModel.isButtonsDisabled)
                }
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
                    .disabled(viewModel.isButtonsDisabled)
                }
            }
            .padding()
            .frame(maxWidth: 400)
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            focusedField = nil
        }
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
//            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
//            .previewDisplayName("LoginView")
    }
}
