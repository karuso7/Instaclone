//
//  TestView.swift
//  Instaclone
//
//  Created by Nassim Abuhaltam on 05.06.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import ASCollectionView

struct TestView: View {
    var profile: Profile
    @State var dataExample: [Int]
    var bounds = UIScreen.main.bounds
    
    var body: some View {
        ASCollectionView(data: dataExample, dataID: \.self) { item, _ in
            Button(action: {
                print("Image tapped")
            }) {
                self.profile.images[item].resizable().frame(width: self.bounds.size.width/3)
            } .buttonStyle(PlainButtonStyle())
            }
        .layout {
            .grid(layoutMode: .adaptive(withMinItemSize: self.bounds.size.width/3),
                  itemSpacing: 0,
                  lineSpacing: 0,
                  itemSize: .absolute(self.bounds.size.width/3))
        }.padding(-20).padding(.vertical, 20)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(profile: profileData[1], dataExample: (0 ..< profileData[1].images.count).map { $0 })
    }
}
