//
//  SearchResult.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 05.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct SearchResultView: View {
    var string: String
    
    var body: some View {
        VStack {
            List {
                //Text wird später ersetzt durch die tatsächlichen Ergebnisse
                Text("Suche nach: " + string)
            }.padding(.horizontal, -20)
            Spacer()
        }
    }
}
