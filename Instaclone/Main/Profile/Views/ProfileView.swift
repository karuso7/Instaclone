//
//  ContentView.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 19.05.20.
//  Copyright © 2020 Nassim Abuhaltam. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var profile: Profile
    
    var body: some View {
        VStack {
            HStack{
                CircleImage(image: profile.pb)
                    .offset(x: 0, y: 0)
                    .padding(.top, 0)
                VStack {
                    Text(String(profile.contributions))
                    Text("Beiträge").bold()
                    .font(.subheadline)
                }
                VStack {
                    Text(String(profile.subscriber))
                    Text("Abonnenten").bold()
                    .font(.subheadline)
                }
                VStack {
                    Text(String(profile.subscribed))
                    Text("Abonniert").bold()
                    .font(.subheadline)
                }
                   
            }.padding()
        
            VStack {
                
                HStack {
                    Text(profile.name).bold()
                    Spacer()
                }.padding(.top, 0)
                
                HStack {
                    Text(profile.status)
                    Spacer()
                }.padding(.top, 0)
                
            }.padding()
            
            VStack {
                HStack {
                    //dataExample ist in dem Fall nur ein Array mit Integern (Anzahl der Fotos des jeweiligen Profils). Eine sauberere Lösung widrd noch gesucht.
                    PictureCollectionView(profile: profile, dataExample: (0 ..< profile.images.count).map { $0 })
                }
            }.padding(.top, 0)
            
            Spacer()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: profileData[0])
    }
}
