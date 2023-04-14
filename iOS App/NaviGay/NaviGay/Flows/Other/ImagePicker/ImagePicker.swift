//
//  ImagePicker.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 22.03.23.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    // MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    let sourceType: UIImagePickerController.SourceType
    
    // MARK: - Functions
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // MARK: - Coordinator
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                /// TODO - Как изменить растяжение
                ///
                //                parent.image = image
                //            }
                //            parent.presentationMode.wrappedValue.dismiss()
                
                //           let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
                parent.image = image.resized(toWidth: 450)
            }
                parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
