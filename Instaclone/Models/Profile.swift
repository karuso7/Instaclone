/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Profile: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var subscriber: Int
    var subscribed: Int
    var imageNames: [String]
    fileprivate var imageName: String
    var status: String

}

extension Profile {
    var pb: Image {
        ImageStore.shared.image(name: imageName)
    }
    var contributions: Int {
        imageNames.count
    }
    var images: [Image] {
        imageNames.map { ImageStore.shared.image(name: $0) }
    }
}

