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
    
    @State var testMessages: [Message] = [Message(messageText: "Test123", isReceived: false),
                                   Message(messageText: "Nochmal Test123", isReceived: true),
                                   Message(messageText: "Selber Test123", isReceived: false),
                                   Message(messageText: "Nochmal Test123", isReceived: true),
                                   Message(messageText: "Nochmal Test123", isReceived: true)
                                   ]
    
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
            
            VStack {
                List {
                    ForEach(self.testMessages) { message in
                            MessageTextView(message: message)
                    }

                }
                
            }
                
     
            HStack {
                TextField("Nachricht schreiben...", text: self.$messageInput).lineLimit(nil)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.testMessages.append(Message(messageText: self.messageInput, isReceived: false))
                    self.messageInput = ""
                }) {
                    Text("Senden").frame(width: 60, height: 38, alignment: .center)
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





