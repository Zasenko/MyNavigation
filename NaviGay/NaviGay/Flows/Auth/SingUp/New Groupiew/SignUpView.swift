//
//  SignUpView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 22.03.23.
//

import SwiftUI


struct SignUpView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - View
    var body: some View {
        GeometryReader { geo in
            Spacer()
            VStack {
                Text("Sign Up")
                    .font(.system(size: 40)).bold()
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width*0.3)
                      //  .clipShape(Circle())
                        .padding()
                        .onTapGesture {
                            viewModel.showImagePicker = true
                        }
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width*0.3)
                        .padding()
                      //  .clipShape(Circle())
                        .onTapGesture {
                            viewModel.showImagePicker = true
                        }
                }
                
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
//                TextField("Name", text: $viewModel.name)
//                    .padding()
//                    .autocapitalization(.words)
//
                HStack {
                    AsyncButton(backgroundColor: AppColors.red,
                                state: $viewModel.signUpButtonState) {
                        viewModel.loginButtonTapped()
                    } content: {
                        Text("Sign up")
                    }
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Сancel")
                            .padding()
                            .foregroundColor(.gray)
                    }
                    .disabled(viewModel.isCancelButtonAvailable)
                }
                
                
            }
            .padding()
            .sheet(isPresented: $viewModel.showImagePicker) {
                ImagePicker(image: $viewModel.image)
        }
        }
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
