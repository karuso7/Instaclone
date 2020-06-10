//
//  ConversationEntryScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 09.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct ConversationEntryScreen: View {
    @State var username: String = "UserXY"
    @State var chatPreview: String = "Vorschau des Chats..."
    var body: some View {
        
        SingleNavigationLink(destination: ChatScreen()) {
            
            HStack {
                UserProfileImage(image: Image("default_profile_m"))
                VStack(alignment: .leading) {
                    Text("\(self.username)").bold()
                    Text("\(self.chatPreview)").foregroundColor(.gray)
                }
                
                
            }
            .padding(.top, 16)
        }
    }
}

struct ConversationEntryScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConversationEntryScreen()
    }
}
