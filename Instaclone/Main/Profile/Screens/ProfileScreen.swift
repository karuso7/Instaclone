//
//  File.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 02.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct ProfileScreen: View {
    var profile: Profile
    
    var body: some View {
        ProfileView(profile: profile)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(profile: profileData[1])
    }
}
