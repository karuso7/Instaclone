//
//  MessageTextView.swift
//  Instaclone
//
//  Created by Karsten Krause on 09.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct MessageTextView: View {
    let message: Message
    
    
    var body: some View {
        
        
        VStack(alignment: self.message.isReceived ? .leading : .trailing ) {
            
            VStack(alignment: .leading) {
                
                
                    
                HStack(alignment: .bottom) {
                    if self.message.isReceived {
                        UserProfileImage(image: Image("default_profile_m"))
                    }
                    Text("\(self.message.messageText)")
                            
                            .padding()
                        .background(self.message.isReceived ? nil : Color.gray )
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 1)
                                
                                
                        )
                            
                        
                    
                    
                }.frame(minWidth: 0, maxWidth: self.message.isReceived ? 300 : 250, minHeight: 0, maxHeight: .infinity, alignment: self.message.isReceived ? .topLeading : .topTrailing)
                
                
                
                
            }
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: self.message.isReceived ? .topLeading : .topTrailing)
        
        
    }

}

struct MessageTextView_Previews: PreviewProvider {
    static var previews: some View {
        MessageTextView(message: Message(messageText: "Test123", isReceived: true))
        
    }
}




