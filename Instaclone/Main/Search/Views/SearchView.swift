//
//  SearchView.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 05.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Suche", text: self.$search) {
                    UIApplication.shared.endEditing()
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }.padding(.top)
            
            HStack {
                List {
                    //Ergebnisse sollen sich wärend der Sucheingabe aktualisieren
                    Text("")
                }.padding(.horizontal, -20)
            }
            
            Spacer()
            
        }.padding()
        
    }
}
