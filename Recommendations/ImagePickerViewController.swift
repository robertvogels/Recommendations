//
//  ImagePickerViewController.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct ImageCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: UIImage?
    @Binding var imageView: Image?

    var body: some View {
        ImagePicker(isPresented: $showImagePicker, image: $image, imageView: $imageView)
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isPresented: Bool
    @Binding var image: UIImage?
    @Binding var imageView: Image?
    
    init(isPresented: Binding<Bool>, image: Binding<UIImage?>, imageView: Binding<Image?>) {
        _isPresented = isPresented
        _image = image
        _imageView = imageView
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        image = (info[UIImagePickerController.InfoKey.editedImage ] as! UIImage)
        self.imageView = Image(uiImage: image!)
//        let imageData = uiImage.pngData()
//
//        imageString = imageData?.base64EncodedString()
//        image = Image(uiImage: uiImage)
        isPresented = false
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        isPresented = false
        
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    @Binding var image: UIImage?
    @Binding var imageView: Image?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        
        return ImagePickerCoordinator(isPresented: $isPresented, image: $image, imageView: $imageView)
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
}

