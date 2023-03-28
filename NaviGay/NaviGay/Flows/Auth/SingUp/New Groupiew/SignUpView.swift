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
    @Namespace var topID
    @StateObject var viewModel: SignUpViewModel
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Private properties
    
    @FocusState private var focusedField: Field?
    
    // MARK: - View
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    dismissButton
                    VStack {
                        photoView
                        emailField
                        passwordField
                        errorView
                        nameField
                        bioField
                            .onTapGesture {
                                proxy.scrollTo(topID)
                            }
                        signUpButtonView
                            .id(topID)
                    }
                    .padding()
                    .frame(maxWidth: 400)
                    .ignoresSafeArea(.keyboard)
                    
                }
                .frame(width: geometry.size.width)
                .ignoresSafeArea(.keyboard)
                .scrollDismissesKeyboard(.immediately)
                .disabled(viewModel.allViewsDisabled)
                .sheet(isPresented: $viewModel.showImagePicker) {
                    ImagePicker(image: $viewModel.image)
                }
                .onTapGesture {
                    focusedField = nil
                }
            }
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
    
    private var photoView: some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .clipShape(Circle())
                    .padding()
                    .onTapGesture {
                        viewModel.showImagePicker = true
                    }
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(width: 150)
                    .background(AppColors.lightGray)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .onTapGesture {
                        viewModel.showImagePicker = true
                    }
            }
            Menu {
                Button("from album") {
                    //
                }
                Button("from camera") {
                    //
                }

            } label: {
                Text("add photo")
            }
            .font(.callout)
            .padding(.bottom)
        }.padding(.bottom)
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
    
    private var nameField: some View {
        HStack {
            Image(systemName: "person")
                .foregroundColor(.secondary)
                .frame(width: 20)
            TextField("Name", text: $viewModel.name)
                .focused($focusedField, equals: .name)
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
        .modifier(ShakeEffect(animatableData: CGFloat(viewModel.invalidNameAttempts)))
        .padding(.bottom, 8)
    }
    
    private var bioField: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.text.rectangle")
                .foregroundColor(.secondary)
                .frame(width: 16)
                .padding(.vertical, 10)
            ZStack(alignment: .topLeading) {
                TextEditor(text: $viewModel.bio)
                    .frame(height: 60)
                    .scrollContentBackground(.hidden)
                    .focused($focusedField, equals: .bio)
                    .onSubmit {
                        focusedField = nil
                    }
                if viewModel.bio.isEmpty {
                    Text("About")
                        .foregroundColor(Color(uiColor: .gray).opacity(0.5))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 6)
                }
            }
        }
        .padding()
        .background(AppColors.lightGray)
        .cornerRadius(8)
        .padding(.bottom)
        .padding(.bottom)
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
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel(authManager: AuthManager()))
    }
}
