//
//  ScreenRouter.swift
//  Instaclone
//
//  Created by Karsten Krause on 29.05.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import Combine

// Ermöglicht Navigation zwischen Screens, ohne eine NavigationView nutzen zu müssen
// Wird ermöglicht mittels Observable Objects und Animationen
class ScreenRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ScreenRouter, Never>()
    
    var currentScreen: String = "loginScreen" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
    
}
