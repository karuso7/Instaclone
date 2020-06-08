//
//  ImagePicker.swift
//  Instaclone
//
//  Created by Karsten Krause on 06.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: Durch UIViewControllerRepresentable kann ich UIKit in SwiftUI nutzen
struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator

    @Binding var image: UIImage?
    @Binding var imageIsShown: Bool
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePickerCoordinator(image: $image, imageIsShown: $imageIsShown)
    }
}
