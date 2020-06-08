//
//  ImagePickerCoordinator.swift
//  Instaclone
//
//  Created by Karsten Krause on 06.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - Properties
    @Binding var image: UIImage?
    @Binding var imageIsShown: Bool
    
    // MARK: - Initializer
    init(image: Binding<UIImage?>, imageIsShown: Binding<Bool>) {
        _image = image
        _imageIsShown = imageIsShown
    }
    
    
    // MARK: Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiImage
            imageIsShown = false
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imageIsShown = false
    }
}
