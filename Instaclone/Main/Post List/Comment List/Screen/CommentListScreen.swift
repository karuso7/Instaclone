//
//  CommentList.swift
//  Instaclone
//
//  Created by Karsten Krause on 01.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct CommentListScreen: View {
    // Initializer, um die Liste ohne Linien darzustellen
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List() {
            CommentScreen()
            CommentScreen()
            CommentScreen()
        }
    }
}

struct CommentList_Previews: PreviewProvider {
    static var previews: some View {
        CommentListScreen()
    }
}
