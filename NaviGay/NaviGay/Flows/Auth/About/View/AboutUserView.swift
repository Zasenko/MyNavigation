//
//  AboutUserView.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 29.03.23.
//

import SwiftUI

struct AboutUserView: View {
    
    private enum Field: Hashable {
        case name, bio, instagram // TODO Insta
    }
    
    // MARK: - Properties
    @StateObject var viewModel: AboutUserViewModel
    
    // MARK: - Private properties
    @FocusState private var focusedField: Field?
    
    // MARK: - View
    var body: some View {
        VStack {
            photoView
            nameField
                .onTapGesture {
                    focusedField = .name
                }
            
            bioField
                .onTapGesture {
                    focusedField = .bio
                }
            Spacer()
        }
        .padding()
        .disabled(viewModel.allViewsDisabled)
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(image: $viewModel.image)
        }
        .onTapGesture {
            focusedField = nil
        }
    }
    
    // MARK: - Private properties / Views
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
        }
        .padding(.bottom)
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
                .foregroundColor(viewModel.invalidNameAttempts == 0 ? .clear : .red)
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
                        .onTapGesture {
                            focusedField = .bio
                        }
                }
            }
        }
        .padding()
        .background(AppColors.lightGray)
        .cornerRadius(8)
        .padding(.bottom, 8)
    }
}

struct AboutUserView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUserView(viewModel: AboutUserViewModel())
    }
}
