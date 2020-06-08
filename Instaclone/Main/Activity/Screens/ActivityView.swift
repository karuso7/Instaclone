//
//  SearchView.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 05.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
    
    var body: some View {
        VStack {
            List {
                OneActivityView(name: "Max Mustermann", action: 2, beitrag: 6)
                OneActivityView(name: "Sebastian Pöhlmann", action: 1, beitrag: 0)
                OneActivityView(name: "Bernd Bauer", action: 1, beitrag: 0)
                OneActivityView(name: "Susanhaltam", action: 3, beitrag: 7)
                OneActivityView(name: "Luc Reinke", action: 2, beitrag: 3)
                OneActivityView(name: "Luc Reinke", action: 3, beitrag: 6)
                OneActivityView(name: "Luc Reinke", action: 1, beitrag: 0)
                OneActivityView(name: "Jannis Kramer", action: 1, beitrag: 0)
                OneActivityView(name: "Dennis Preis", action: 2, beitrag: 2)
            }.padding(.horizontal, -20)
            Spacer()

        }
    }
}
