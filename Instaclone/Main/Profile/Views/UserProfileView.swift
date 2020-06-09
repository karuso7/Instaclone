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
            ProfileHeaderView(profile: profile)
            
            HStack {
                Button(action: {
                    print("Follow tapped")
                    self.followButtonTapped.toggle()
                }) {
                    if followButtonTapped {
                        VStack {
                            Text("Nicht mehr folgen")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 35)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .cornerRadius(5)
                        }
                    } else {
                        VStack {
                            Text("Abonnieren")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 35)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(5)
                        }
                    }
                } .buttonStyle(PlainButtonStyle())
            }.padding(.horizontal).padding(.top)
            
            VStack {
                HStack {
                    PictureCollectionView(profile: profile, dataExample: (0 ..< profile.images.count).map { $0 })
                }
            }.padding(.top)
            
            Spacer()
            
        }.navigationBarTitle(Text(String(profile.id)), displayMode: .inline)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(profile: profileData[1])
    }
}
