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
            ProfileHeaderView(profile: profile)
            
            VStack {
                HStack {
                    //dataExample ist in dem Fall nur ein Array mit Integern (Anzahl der Fotos des jeweiligen Profils). Eine sauberere Lösung widrd noch gesucht.
                    PictureCollectionView(profile: profile, dataExample: (0 ..< profile.images.count).map { $0 })
                }
            }.padding(.top)
            
            Spacer()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: profileData[0])
    }
}
