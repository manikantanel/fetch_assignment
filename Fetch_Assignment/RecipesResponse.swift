//
//  RecipesResponse.swift
//  Fetch_Assignment
//
//  Created by Manikantan Eakiri Lakshmanan on 5/13/25.
//

import Foundation

struct RecipesResponse: Decodable {
    let recipes: [Recipe]?

    enum CodingKeys: String, CodingKey {
        case recipes
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Try to decode if key exists and is valid
        recipes = try? container.decodeIfPresent([Recipe].self, forKey: .recipes)
    }
}





