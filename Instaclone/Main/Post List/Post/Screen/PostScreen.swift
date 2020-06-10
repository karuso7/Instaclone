//
//  PostScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 01.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct PostScreen: View {
    
    @State var likeButtonTapped = false
    var username: String = "UserXY"
    var likes: Int = 42
    var commentNumber: Int = 12
    var postDescription: String = "Eine ganz tolle Aussicht im Dorf Fernwald. Hier stehen Bäume auf Wiesen und irhemdwelche Anhänger"
    
    
    var body: some View {
        
        
        
        VStack(alignment: .leading) {
            
            VStack {
                
                SingleNavigationLink(destination: UserProfileScreen(profile: profileData[1]) ) {
                    HStack {
                        UserProfileImage(image: Image("default_profile_m"))
                        Text("\(self.username)").bold()
                    }
                    
                }
                
                
                
                
            }
            .padding(.leading, 15)
                
            VStack{
                Image("default_post_picture")
                    .resizable()
                    .scaledToFit()
            }
            
           
            HStack {
                Button(action: {
                    print("Like tapped")
                    self.likeButtonTapped.toggle()
                }) {
                    if likeButtonTapped {
                        Image(systemName: "suit.heart.fill").foregroundColor(.red).imageScale(.large)
                    } else {
                        Image(systemName: "heart").foregroundColor(.primary).imageScale(.large)
                    }
                    
                } .buttonStyle(PlainButtonStyle())
                    .padding(.trailing)
                    
                
                SingleNavigationLink(destination: CommentListScreen() ) {
                    Image(systemName: "message").foregroundColor(.primary).imageScale(.large)
                }
                
                Spacer()
                Text("Gefällt \(likes) Mal")
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .padding(.top, 10)
            
            VStack(alignment: .leading) {
                
                SingleNavigationLink(destination: UserProfileScreen(profile: profileData[1]) ) {
                    Text("\(self.username)").bold()
                }
                
            
                Text("\(postDescription)")
                
                SingleNavigationLink(destination: CommentListScreen() ) {
                    Text("Alle \(self.commentNumber) Kommentare ansehen").foregroundColor(.gray)
                }
                
            }.padding()
            
            
            
        }
            .padding(.top, 20)
            
    }
}

struct PostScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostScreen()
    }
}




