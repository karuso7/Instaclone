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
                    PictureCollectionView(images: profile.images)
                }
            }
            
            Spacer()
            
        }.navigationBarTitle(Text(String(profile.id)), displayMode: .inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: profileData[0])
    }
}
