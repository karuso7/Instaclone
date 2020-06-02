//
//  ProfileRow.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 19.05.20.
//  Copyright © 2020 Nassim Abuhaltam. All rights reserved.
//

import SwiftUI

struct ProfileRow: View {
    var profile: Profile
    
    var body: some View {
        HStack {
            profile.pb
                .resizable()
                .frame(width: 50, height: 50)
            Text(profile.id)
            Spacer()
        }
    }
}
