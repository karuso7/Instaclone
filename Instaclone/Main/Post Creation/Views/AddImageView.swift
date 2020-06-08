//
//  AddImageView.swift
//  Instaclone
//
//  Created by Karsten Krause on 08.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI

struct AddImageView: View {
    var body: some View {
        Image(systemName: "plus.circle.fill").imageScale(.large).foregroundColor(.blue).frame(width: 25, height: 25, alignment: .center).offset(x:5 ,y: -27)
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}
