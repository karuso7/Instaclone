//
//  ProfileHeaderView.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 09.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct ProfileHeaderView: View {
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
                   
            }.padding(.horizontal).padding(.top)

            VStack {
                HStack {
                    Text(profile.name).bold()
                    Spacer()
                }.padding(.top, 0)
                
                HStack {
                    Text(profile.status)
                    Spacer()
                }.padding(.top, 0)
                
            }.padding(.horizontal).padding(.top)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(profile: profileData[0])
    }
}
