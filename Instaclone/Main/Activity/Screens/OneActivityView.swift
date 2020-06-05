//
//  OneActivityView.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 05.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct OneActivityView: View {
    var bounds = UIScreen.main.bounds
    //Test daten
    var name: String
    var action: Int // Beispiele: 1 = folgen, 2 = liken, 3 = kommentieren
    var beitrag: Int //Nur bei liken oder kommentieren
    
    private var message: String {
        switch action {
        case 1:
            return (name + " folgt dir jetzt")
        case 2:
            return (name + " gefällt dein Foto No. " + String(beitrag))
        case 3:
            return (name + " hat Foto No. " + String(beitrag) + " kommentiert")
        default:
            return "fehler"
        }
        
    }
    
    
    
    var body: some View {
        HStack {
            VStack {
                UserProfileImage(image: profileData[1].pb)
            }
            VStack {
                Text(message)
            }
        }.padding()
    }
    
}
