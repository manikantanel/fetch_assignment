//
//  Recipe.swift
//  Fetch_Assignment
//
//  Created by Manikantan Eakiri Lakshmanan on 5/13/25.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    let id: UUID
    let name: String
    let cuisine: String
    let photoURLLarge: URL?
    let photoURLSmall: URL?
    let sourceURL: URL?
    let youtubeURL: URL?

    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case id = "uuid"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}

