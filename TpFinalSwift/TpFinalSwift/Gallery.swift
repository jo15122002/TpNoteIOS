// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gallery = try? newJSONDecoder().decode(Gallery.self, from: jsonData)

import Foundation

// MARK: - GalleryElement
struct GalleryElement: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Gallery = [GalleryElement]
