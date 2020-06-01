//
//  CommentScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 01.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct CommentScreen: View {
    @State var likeButtonTapped = false
    var likes = 26
    
    var commentText: String = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor                               invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                
                HStack(alignment: .top) {
                    SingleNavigationLink(destination: UserProfileScreen()) {
                        UserProfileImage(image: Image("default_profile_m"))
                    }
                    
                    Text("\(self.commentText)")
                }
                
                
                Button(action: {
                    print("Like tapped")
                    self.likeButtonTapped.toggle()
                }) {
                    if likeButtonTapped {
                        Image(systemName: "suit.heart.fill").foregroundColor(.red).imageScale(.small)
                    } else {
                        Image(systemName: "heart").foregroundColor(.primary).imageScale(.small)
                    }
                    
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.leading, 20)
            }.padding(.top, 15)
            
            Text("Gefällt \(likes) Mal").foregroundColor(.gray)
                .padding(.leading, 48)
           
        }
    }
}

struct CommentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CommentScreen()
    }
}
