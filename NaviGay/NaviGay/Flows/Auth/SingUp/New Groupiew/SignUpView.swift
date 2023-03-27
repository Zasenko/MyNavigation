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
    
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Private properties
    
    @FocusState private var focusedField: Field?
    
    // MARK: - View
    
    var body: some View {
        VStack {//ScrollView(.vertical, showsIndicators: false) {
            VStack {
                //ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    if let image = viewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140)
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
                            .frame(width: 140)
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
                    .disabled(viewModel.isButtonsDisabled)
                    .padding(.bottom)
                    
                    
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
                            .foregroundColor(viewModel.invalidLoginAttempts == 0 ? .clear : .red)
                    }
                    .modifier(ShakeEffect(animatableData: CGFloat(viewModel.invalidLoginAttempts)))
                    .padding(.bottom, 10)
                    
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
                            .foregroundColor(viewModel.invalidPasswordAttempts == 0 ? .clear : .red)
                    }
                    .modifier(ShakeEffect(animatableData: CGFloat(viewModel.invalidPasswordAttempts)))
                    
                    HStack {
                        Text("Tell more about you")
                    }
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.secondary)
                            .frame(width: 20)
                        TextField("Name", text: $viewModel.name)
                            .focused($focusedField, equals: .name)
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
                    
                    HStack(alignment: .top) {
                        Image(systemName: "person.text.rectangle")
                            .foregroundColor(.secondary)
                            .frame(width: 16)
                            .padding(.vertical, 10)
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $viewModel.bio)
                                .frame(height: 120)
                                .scrollContentBackground(.hidden)
                                .focused($focusedField, equals: .bio)
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
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                        // .stroke(lineWidth: 1)
                            .foregroundColor(.clear)
                    }
                    .padding(.bottom)
                    .padding(.bottom)
                    
                    HStack {
                        AsyncButton(backgroundColor: AppColors.red,
                                    state: $viewModel.signUpButtonState) {
                            viewModel.SignUpButtonTapped()
                        } content: {
                            Text("Sign up")
                        }
                        Button {
                            dismiss()
                        } label: {
                            Text("Сancel")
                                .padding()
                        }
                        .disabled(viewModel.isButtonsDisabled)
                    }
                }
                .padding()
            }
            .frame(maxWidth: 400)
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(image: $viewModel.image)
        }
        .onTapGesture {
            focusedField = nil
        }
     //   .scrollDismissesKeyboard(.immediately)
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbarBackground(AppColors.background, for: .navigationBar)
//        .toolbar(.visible, for: .navigationBar)
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//                Text("Sign Up")
//                    .font(.system(size: 30)).bold()
//                    .padding(.bottom, 4)
//            }
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button {
//                    dismiss()
//                } label: {
//                    Image(systemName: "xmark")
//                        .foregroundColor(AppColors.red)
//                        .bold()
//                }
//                .disabled(viewModel.isButtonsDisabled)
//            }
//        }
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
        //            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
        //            .previewDisplayName("iPhone 14")
        //        SignUpView()
        //            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
        //            .previewDisplayName("iPhone 14 Pro Max")
        //        SignUpView()
        //            .previewDevice(PreviewDevice(rawValue: "iPad (8th generation)"))
        //            .previewDisplayName("iPad (8th generation)")
    }
}
