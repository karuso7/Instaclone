//
//  Message.swift
//  Instaclone
//
//  Created by Karsten Krause on 10.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import Foundation

class Message: Identifiable {
    
    let messageText: String
    let isReceived: Bool
    var id = UUID()
    
    init(messageText: String, isReceived: Bool) {
        self.messageText = messageText
        self.isReceived = isReceived
    }
}
