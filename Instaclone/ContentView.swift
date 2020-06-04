//
//  ContentView.swift
//  Instaclone
//
//  Created by Karsten Krause on 29.05.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
        VStack {
            if screenRouter.currentScreen == "loginScreen" {
                LoginScreen()
            } else if screenRouter.currentScreen == "registrationScreen" {
                RegistrationScreen()
                    .transition(.scale)
            } else if screenRouter.currentScreen == "homeScreen" {
                HomeScreen()
                    .transition(.scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: - Extensions
// zum Verschwinden der Tastertur
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
