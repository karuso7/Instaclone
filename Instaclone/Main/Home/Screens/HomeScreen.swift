//
//  HomeScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 29.05.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct HomeScreen: View {
    
    @EnvironmentObject var screenRouter: ScreenRouter
    @State var refreshIsShowing = false
    
    // MARK: - Custom Initializer
    // MARK: Navigation Bars lassen sich allein durch SwiftUI nicht stylen.
    // SwiftUI nutzt für einen NavigationView eine UINavigationBar (schön zu sehen in der Debut View Hierarchy).
    // Durch die UINavigationbar lässt sich dann der Style der NavigationBar der NavigationView von SwiftUI ändern
    init() {
        UINavigationBar.appearance().backgroundColor = .systemBackground
    }
    
    var body: some View {
        VStack {

                        
                        .navigationBarItems(
                            leading:
                            HStack {
                                Button(action: {
                                    self.screenRouter.currentScreen = "loginScreen"
                                    
                                }) {
                                    Image(systemName: "arrow.uturn.left.circle").imageScale(.large).foregroundColor(.primary).frame(width: 40, height: 35, alignment: .leading)
                                }            
                            },
                            
                            trailing:
                            HStack {
                                Button(action: {
                                    print("Messenger öffnen")
                                    self.screenRouter.currentScreen = "messengerScreen"
                                }) {
                                    Image(systemName: "paperplane").imageScale(.large).foregroundColor(.primary).frame(width: 40, height: 30, alignment: .trailing)
                                }
                            }

            
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().environmentObject(ScreenRouter())
    }
}
