//
//  ContentView.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 19.05.20.
//  Copyright © 2020 Nassim Abuhaltam. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    var profile: Profile
    @State var followButtonTapped = false
    
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
            
            HStack {
                Button(action: {
                    print("Follow tapped")
                    self.followButtonTapped.toggle()
                }) {
                    if followButtonTapped {
                        Image(systemName: "minus.circle.fill").foregroundColor(.gray).imageScale(.large)
                    } else {
                        Image(systemName: "plus.circle.fill").foregroundColor(.blue).imageScale(.large)
                    }
                } .buttonStyle(PlainButtonStyle())
                    .padding(.trailing)
            }
            
            VStack {
                HStack {
                    PictureCollectionView(images: profile.images)
                }
            }.padding(.top, 0)
            
            Spacer()
            
        }.navigationBarTitle(Text(String(profile.id)), displayMode: .inline)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(profile: profileData[0])
    }
}
