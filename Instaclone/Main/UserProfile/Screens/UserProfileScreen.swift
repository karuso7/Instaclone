//
//  UserProfileScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 01.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct UserProfileScreen: View {
    var profile: Profile
    
    var body: some View {
        UserProfileView(profile: profile)
    }
}

struct UserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileScreen(profile: profileData[1])
    }
}
