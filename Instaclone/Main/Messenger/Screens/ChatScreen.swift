//
//  ChatScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 09.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import KeyboardObserving

struct ChatScreen: View {
    
    @State private var messageInput: String = ""
    
    private var messageTyped: Bool {
        if messageInput.count > 0 {
            return true
        }
        return false
    }
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UINavigationBar.appearance().backgroundColor = .systemBackground
    }
    
    var body: some View {
        
        VStack {
            
            List {
                
                MessageTextView(isReceived: true)
                MessageTextView(isReceived: false)
                MessageTextView(isReceived: true)
                
            }.padding(.top, 16)
            
            HStack {
                
                TextField("Nachricht schreiben...", text: self.$messageInput).lineLimit(nil)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {print("Posten getappt")}) {
                    Text("Senden")
                }.disabled(!messageTyped)
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.bottom, 5)
            
            
            
        }.keyboardObserving()
        
    }
    
}



struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
    }
}
