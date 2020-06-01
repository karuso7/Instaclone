//
//  SingleNavigationLink.swift
//  Instaclone
//
//  Created by Karsten Krause on 01.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI


// Custom-NavigationLink, um mehrere verschiedene Navigationlinks in einer NavigationView-Zeile platzieren zu können.
// Dieser Struct ersetzt den üblichen Navigationlink und entfernt die Highlights der Zeile, auf die Getappt wird.
struct SingleNavigationLink<Content, Destination>: View where Destination: View, Content: View {
    let destination:Destination?
    let content: () -> Content


    @State private var isLinkActive:Bool = false

    init(destination: Destination, title: String = "", @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.destination = destination
    }

    var body: some View {
        return ZStack (alignment: .leading){
            if self.isLinkActive{
                NavigationLink(destination: destination, isActive: $isLinkActive){Color.clear}.frame(height:0)
            }
            content()
        }
        .onTapGesture {
            self.pushHiddenNavLink()
        }
    }

    func pushHiddenNavLink(){
        self.isLinkActive = true
    }
}
