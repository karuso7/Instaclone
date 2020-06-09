//
//  ConversationListScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 09.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct ConversationListScreen: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    @State var refreshIsShowing: Bool = false
    
    // Initializer, um die Liste ohne Linien darzustellen
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UINavigationBar.appearance().backgroundColor = .systemBackground
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            TabView {
                NavigationView {
                    
                    List() {
                        ConversationEntryScreen()
                        ConversationEntryScreen()
                        ConversationEntryScreen()
                        ConversationEntryScreen()
                        ConversationEntryScreen()
                        ConversationEntryScreen()
                    }
                    
                    .navigationBarItems(
                    leading:
                        HStack {
                            Button(action: {
                                self.screenRouter.currentScreen = "homeScreen"
                            }) {
                                Image(systemName: "house.fill").imageScale(.large).foregroundColor(.primary)
                            }
                        }
                    ).navigationBarTitle(
                    Text("Messenger"), displayMode: .inline)
                    
                }.navigationViewStyle(StackNavigationViewStyle())
                 .pullToRefresh(isShowing: $refreshIsShowing) {
                     DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                         // MARK: TODO: Firebase-Daten neu laden!
                         print("Lade Daten aus Firebase Datenbank")
                         self.refreshIsShowing = false
                     }
                 }
            }
                
            
        
        }
    }
}

struct ConversationListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListScreen().environmentObject(ScreenRouter())
    }
}
