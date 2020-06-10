//
//  PostList.swift
//  Instaclone
//
//  Created by Karsten Krause on 01.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI



struct PostListScreen: View {
    
    // Initializer, um die Liste ohne Linien darzustellen
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        
        List() {
            PostScreen()
            PostScreen()
            PostScreen()
            PostScreen()
        }.padding(.horizontal, -20)
        
            
            
            
        
            
        
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostListScreen()
    }
}
