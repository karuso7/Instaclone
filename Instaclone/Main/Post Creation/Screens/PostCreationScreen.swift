//
//  PostCreationScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 06.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct PostCreationScreen: View {
    @State private var showActionSheet: Bool = false
    @State private var showImgagePicker: Bool = false
    @State private var image: UIImage? 
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State var imageDescription: String = ""
    
    var imageSelected: Bool {
        if image != nil {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                
                // MARK: - Bildauswahl
                Button(action: {
                    self.showActionSheet.toggle()
                }) {
                    VStack(alignment: .trailing) {
                        Image(uiImage: image ?? UIImage(named: "placeholder-image")!)
                        .resizable().frame(width: 80, height: 80, alignment: .center).cornerRadius(1).padding(1).background(Color.primary)
                        if image == nil {
                            AddImageView()
                        }
                    }
                    
                    
                    
                }
                    
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("Wähle ein Foto aus"),
                                
                                buttons: [
                                    .default(Text("Fotogalerie")) {
                                        self.showImgagePicker.toggle()
                                        
                                        self.sourceType = .photoLibrary
                                        
                                    },
                                    
                                    .default(Text("Kamera")) {
                                        self.showImgagePicker.toggle()
                                        
                                        self.sourceType = .camera
                                    },
                                    .cancel(Text("Abbrechen"))
                        ]
                    )
                    
                    
                    
                }
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $showImgagePicker) {
                    ImagePicker(image: self.$image, imageIsShown: self.$showImgagePicker , sourceType: self.sourceType)
                }
                
                // MARK: - Bildbeschreibung
                
                TextField("Bildunterschrift verfassen...", text: $imageDescription)
                
                
                
            }
            .padding()
            Spacer()
            
            VStack{
                Button(action: {
                    print("Hier soll das Bild geteilt werden und zurück zum Homefeed gesprungen werden.")
                }) {
                    Text("Teilen")
                        
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 35)
                        .foregroundColor(Color.white)
                        .background(self.imageSelected ? Color.blue : Color.blue.opacity(0.4) )
                        .cornerRadius(5)
                }.disabled(!self.imageSelected)
                .padding()
                
                Button(action: {
                    self.imageDescription = ""
                    self.image = nil
                    
                }) {
                    Text("Abbrechen")
                        
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 35)
                        .foregroundColor(Color.white)
                        .background(self.imageSelected ? Color.red : Color.red.opacity(0.4) )
                        .cornerRadius(5)
                }.disabled(!self.imageSelected)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .padding(.bottom, 16)
            }
            
        }
        
    }
}

struct PostCreationScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostCreationScreen()
    }
}
