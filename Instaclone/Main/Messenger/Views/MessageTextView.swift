//
//  MessageTextView.swift
//  Instaclone
//
//  Created by Karsten Krause on 09.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct MessageTextView: View {
    let isReceived: Bool
    @State var message: String = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."
    
    
    var body: some View {
        
        
        VStack(alignment: self.isReceived ? .leading : .trailing ) {
            
            VStack(alignment: .leading) {
                
                
                    
                HStack(alignment: .bottom) {
                    if isReceived {
                        UserProfileImage(image: Image("default_profile_m"))
                    }
                    Text("\(message)")
                            
                            .padding()
                            .background(self.isReceived ? nil : Color.gray )
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 1)
                                
                                
                        )
                            
                        
                    
                    
                }.frame(minWidth: 0, maxWidth: self.isReceived ? 300 : 250, minHeight: 0, maxHeight: .infinity, alignment: self.isReceived ? .bottomLeading : .bottomTrailing)
                
                
                
                
            }
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: self.isReceived ? .bottomLeading : .bottomTrailing)
    }
}

struct MessageTextView_Previews: PreviewProvider {
    static var previews: some View {
        MessageTextView(isReceived: true)
        
    }
}




