//
//  CommentList.swift
//  Instaclone
//
//  Created by Karsten Krause on 01.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import KeyboardObserving
import SwiftUIRefresh


// MARK: TODO - Kommentare schreiben
// Es fehlt: - Ein Textfeld (Bottom)
//           - Textfeld muss sich mit der Tastertur nach oben verschieben
//           - Ein Sende-Button, der ein Kommentar abgibt und die Tastertur schließt

struct CommentListScreen: View {
    
    @State var commentInput = ""
    @State var refreshIsShowing: Bool = false
    
    private var commentTyped: Bool {
        if commentInput.count > 0 {
            return true
        }
        return false
    }
    // Initializer, um die Liste ohne Linien darzustellen
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack {
            List() {
                CommentScreen()
                CommentScreen()
                CommentScreen()
                CommentScreen()
                CommentScreen()
                CommentScreen()
            }.pullToRefresh(isShowing: $refreshIsShowing) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    // MARK: TODO: Firebase-Daten neu laden!
                    print("Lade Daten aus Firebase Datenbank")
                    self.refreshIsShowing = false
                }
            }
            
          Spacer()
            
            HStack {
                UserProfileImage(image: Image("default_profile_m"))
                TextField("Als User kommentieren...", text: self.$commentInput).lineLimit(nil)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {print("Posten getappt")}) {
                    Text("Posten")
                }.disabled(!commentTyped)
            }
                .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.bottom, 5)
            
                
          
        }.keyboardObserving()
        
        
    }
}

struct CommentList_Previews: PreviewProvider {
    static var previews: some View {
        CommentListScreen()
    }
}
