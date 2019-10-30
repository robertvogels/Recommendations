//
//  ImagePickerViewController.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?

    var body: some View {
        ImagePicker(isPresented: $showImagePicker, image: $image)
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isPresented: Bool
    @Binding var image: Image?
    
    init(isPresented: Binding<Bool>, image: Binding<Image?>) {
        _isPresented = isPresented
        _image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let uiImage = info[UIImagePickerController.InfoKey.editedImage ] as! UIImage
        image = Image(uiImage: uiImage)
        isPresented = false
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        isPresented = false
        
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    @Binding var image: Image?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        
        return ImagePickerCoordinator(isPresented: $isPresented, image: $image)
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
}

