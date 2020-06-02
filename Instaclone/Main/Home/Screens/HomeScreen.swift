//
//  HomeScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 29.05.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    
    // MARK: - Custom Initializer
    // MARK: Navigation Bars lassen sich allein durch SwiftUI nicht stylen.
    // SwiftUI nutzt für einen NavigationView eine UINavigationBar (schön zu sehen in der Debut View Hierarchy).
    // Durch die UINavigationbar lässt sich dann der Style der NavigationBar der NavigationView von SwiftUI ändern
    init() {
        UINavigationBar.appearance().backgroundColor = .systemBackground
    }
    
    var body: some View {
        VStack {
                TabView {
                    NavigationView {
                        PostListScreen()
                            
                        
                        .navigationBarItems(
                            leading:
                            HStack {
                                Button("") {
                                    print("Kameraview muss sich hier öffnen")
                                    
                                }
                                Image(systemName: "camera").imageScale(.large)
                            },
                            
                            trailing:
                            HStack {
                                Button("") {
                                    print("ChatView muss sich hier öffnen")
                                }
                                Image(systemName: "paperplane").imageScale(.large)
                            }
                            )
                            .navigationBarTitle(
                                Text("Instaclone"), displayMode: .inline)
                        
                    }
                        .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem {Image(systemName: "house").imageScale(.large)}
                    
                    NavigationView {
                        Text("Suchen Seite")
                    }.tabItem{Image(systemName: "magnifyingglass").imageScale(.large)}
                    
                    NavigationView {
                        Text("Fotos hinzufügen")
                    }.tabItem{Image(systemName: "plus.square").imageScale(.large)}
                    
                    NavigationView {
                        Text("Likes-Liste")
                    }.tabItem{Image(systemName: "heart").imageScale(.large)}
                    
                    NavigationView {
                        ProfileScreen(profile: profileData[1])
                        .navigationBarItems(
                            trailing:
                            HStack {
                                Button("") {
                                        print("settings soll sich hier öffnen")
                                    }
                                    Image(systemName: "ellipsis").imageScale(.large)
                            }
                        )
                        .navigationBarTitle(
                            Text(profileData[1].name), displayMode: .inline)
                    }.tabItem{Image(systemName: "person.circle").imageScale(.large)}
                        
                }
            
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
