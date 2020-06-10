import SwiftUI
import ASCollectionView

struct PictureCollectionView: View {
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
                  itemSpacing: 5,
                  lineSpacing: 1,
                  itemSize: .absolute(self.bounds.size.width/3))
        }.padding(-20).padding(.vertical, 20)
    }
}

struct PictureCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PictureCollectionView(profile: profileData[1], dataExample: (0 ..< profileData[1].images.count).map { $0 })
    }
}
