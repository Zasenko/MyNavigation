//
//  SignUpView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 22.03.23.
//

import SwiftUI

struct SignUpView: View {
    
    private enum Field: Hashable {
        case email, password, name, bio, instagram
    }
    
    // MARK: - Properties
    @StateObject var viewModel: SignUpViewModel
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Private properties
    @FocusState private var focusedField: Field?
    
    // MARK: - View
    var body: some View {
        //    GeometryReader { geometry in
        //   ScrollViewReader { proxy in
            VStack {
                
                VStack {
                    Spacer()
                    Text("Login")
                        .font(.system(size: 40)).bold()
                    emailField
                        .onTapGesture {
                            focusedField = .email
                        }
                    passwordField
                        .onTapGesture {
                            focusedField = .password
                        }
                    errorView
                    signUpButtonView
                    Spacer()
                }
                .padding()
                .frame(maxWidth: 400)
            }
            .scrollDismissesKeyboard(.immediately)
            .disabled(viewModel.allViewsDisabled)
            .onTapGesture {
                focusedField = nil
            }
        
    }
    
    // MARK: - Private properties / Views
    
    private var dismissButton: some View {
        HStack {
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .padding(.horizontal)
            }
        }
    }
    
    private var emailField: some View {
        HStack {
            Image(systemName: "envelope")
                .foregroundColor(.secondary)
                .frame(width: 20)
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
                .foregroundColor(viewModel.invalidLoginAttempts == 0 && !viewModel.email.isEmpty ? .clear : .red)
        }
        .modifier(ShakeEffect(animatableData: CGFloat(viewModel.invalidLoginAttempts)))
        .padding(.bottom, 8)
    }
    private var passwordField: some View {
        HStack {
            Image(systemName: "lock")
                .foregroundColor(.secondary)
                .frame(width: 20)
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
                .foregroundColor(viewModel.invalidPasswordAttempts == 0 && !viewModel.password.isEmpty ? .clear : .red)
            
        }
        .modifier(ShakeEffect(animatableData: CGFloat(viewModel.invalidPasswordAttempts)))
    }
    
    private var errorView: some View {
        Text(viewModel.error)
            .font(.callout.bold())
            .foregroundColor(AppColors.red)
            .frame(height: 50)
    }
    
    private var signUpButtonView: some View {
        HStack {
            AsyncButton(backgroundColor: AppColors.red,
                        state: $viewModel.signUpButtonState) {
                viewModel.SignUpButtonTapped()
            } content: {
                Text("Sign up")
                    .bold()
                    .foregroundColor(.white)
            }
            Button {
                dismiss()
            } label: {
                Text("Сancel")
                    .padding()
            }
        }
        .padding(.vertical)
        .padding(.vertical)
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel(authManager: AuthManager()))
    }
}
