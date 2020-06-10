//
//  UserProfileImage.swift
//  Instaclone
//
//  Created by Karsten Krause on 01.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct UserProfileImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
        
    }
}

struct UserProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileImage(image: Image("default_profile_m"))
    }
}
