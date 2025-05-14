//
//  RecipeService.swift
//  Fetch_Assignment
//
//  Created by Manikantan Eakiri Lakshmanan on 5/13/25.
//

import Foundation

enum RecipeServiceError: Error, LocalizedError, Equatable {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case emptyRecipes

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The recipe URL is invalid."
        case .invalidResponse:
            return "The server response was not valid."
        case .decodingFailed:
            return "Failed to decode recipe data."
        case .emptyRecipes:
            return "No recipes available."
        }
    }
}


final class RecipeService {
    private let urlString: String

    init(urlString: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") {
        self.urlString = urlString
    }

    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            throw RecipeServiceError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw RecipeServiceError.invalidResponse
        }

        do {
            let decoded = try JSONDecoder().decode(RecipesResponse.self, from: data)
            let recipes = decoded.recipes ?? []

            guard !recipes.isEmpty else {
                throw RecipeServiceError.emptyRecipes
            }

            return recipes
        } catch {
            throw RecipeServiceError.decodingFailed
        }



    }
}

