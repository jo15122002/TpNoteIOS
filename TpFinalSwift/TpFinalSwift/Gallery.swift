// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gallery = try? newJSONDecoder().decode(Gallery.self, from: jsonData)

import Foundation

// MARK: - GalleryElement
struct GalleryElement: Codable, Identifiable, Equatable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
    
    static func defaultGalleryElement()->GalleryElement{
        return GalleryElement(userID: 99, id: 55, title: "A gallery title")
    }
}

typealias Gallery = [GalleryElement]
